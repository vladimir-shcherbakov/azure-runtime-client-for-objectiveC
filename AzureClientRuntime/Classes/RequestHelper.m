//
//  RequestHelper.m
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/2/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import "RequestHelper.h"
#import "JsonCoder.h"
#import "DefaultErrorModel.h"
#import "AzureTypes.h"

@interface RequestHelper (private)

+(void) logRequestBody: (NSData*) body;
+(void) logResponseBody: (NSData*) body;

@end

@implementation RequestHelper (private)

+ (void) logRequestBody: (NSData*) body {
    if (body && body.length > 0) {
        if (body.length<1024) {
            NSString* bodyAsString = [NSString stringWithUTF8String:[body bytes]];
            if (bodyAsString != nil) {
                NSLog(@"\n===> request body: %@", bodyAsString);
            } else {
                NSLog(@"\n===> request body: %@", body);
            }
        } else {
            NSLog(@"\n===> request body: %lu bytes", (unsigned long)body.length);
        }
    } else {
        NSLog(@"\n<=== request body: <empty>");
    }
}

+ (void) logResponseBody: (NSData*) body {
    if (body && body.length > 0) {
        if (body.length<1024) {
            //NSString* bodyAsString = [NSString stringWithUTF8String:[body bytes]];
            NSError* error;
            id json = [NSJSONSerialization JSONObjectWithData: body
                                                      options: NSJSONReadingAllowFragments
                                                        error: &error];
            if (json != nil) {
                NSLog(@"\n===> response body: %@", json);
            } else {
                NSString* bodyAsString = [NSString stringWithUTF8String:[body bytes]];
                if (bodyAsString != nil)
                    NSLog(@"\n===> response body: %@", bodyAsString);
                else
                    NSLog(@"\n===> response body: %@", body);
            }
        } else {
            NSLog(@"\n===> response body: %lu bytes", (unsigned long)body.length);
        }
    } else {
        NSLog(@"\n===> response body: <empty>");
    }
}

@end

@implementation RequestHelper

+ (NSString*) buildUrl: (NSString*) baseUrl
              withPath: (NSString*) path
        withPathParams: (NSDictionary*) pathParams
       withQueryParams: (NSDictionary*) queryParams {
    
    NSString* fullPath =  [NSString stringWithFormat: @"%@%@", baseUrl, path];
    
    for(id key in [pathParams allKeys]) {
        NSString* value = pathParams[key];
        // FIXME: throw if value is null?
        fullPath = [fullPath stringByReplacingOccurrencesOfString:key
                                                       withString:value];
    }
    
    if ([queryParams count] > 0) {
        NSMutableArray * queries = [[NSMutableArray alloc] init];
        for (id key in [queryParams allKeys]) {
            id value = queryParams[key];
            if (![value isEqual:[NSNull null]]) {
                if ([value conformsToProtocol:@protocol(AZBoolean)]) value = [value getBool] ? @"true" : @"false";
                [queries addObject: [NSString stringWithFormat:@"%@=%@", key, value]];
            }
        }

        fullPath = [NSString stringWithFormat: @"%@?%@", fullPath, [queries componentsJoinedByString:@"&"]];
    }
    
    return fullPath;
}

+ (void) executeRequest: (RequestParameters*) requestParams
           withCallback: (void (^)(NSData* _Nullable, NSInteger statusCode, NSError* _Nullable)) callback {


    NSURL *url = [NSURL URLWithString:requestParams.url];
    //NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = requestParams.mehod;
    for (id key in requestParams.headers) {
        [request setValue:requestParams.headers[key] forHTTPHeaderField:key];
    }
   
    if (requestParams.body) {
        
        [RequestHelper logRequestBody:requestParams.body];
        
        request.HTTPBody = requestParams.body;
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task =
        [session dataTaskWithRequest:request
                   completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
             
             if (error) {
                 
                callback(nil, 0, error);
                 
             } else {
                 
                 NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                 
                 callback(data, httpResponse.statusCode, nil);
             }
             
         }];
    
    [task resume];

}

+ (void) executeRequest: (RequestParameters*) requestParameters
      withResponseClass: (nullable Class) responseClass
         withErrorClass: (nullable Class) errorClass
           withCallback: (void (^)(id _Nullable, OperationError* _Nullable)) callback {
    
    [RequestHelper executeRequest:requestParameters
                withResponseClass:responseClass
                 withElementClass:nil
                   withErrorClass:errorClass
                     withCallback:callback];
}

+ (void) executeRequest: (RequestParameters*) requestParameters
      withResponseClass: (nullable Class) responseClass
       withElementClass: (nullable Class) elementClass
         withErrorClass: (nullable Class) errorClass
           withCallback: (void (^)(id _Nullable, OperationError* _Nullable)) callback {
    
    [RequestHelper executeRequest:requestParameters withCallback:^(NSData * data, NSInteger statusCode, NSError* error) {
        
        if (error) {
            
            OperationError* err = [OperationError errorWithDomain:error.domain withReason: error.localizedDescription];
            callback(nil, err);
            return;
        }
        
        [RequestHelper logResponseBody:data];
        
        if (statusCode >= 400) {
            
            if (data && [data length]>0) {
                @try {
                    id serverErr;
                    if (errorClass == [DefaultErrorModel class]) {
                        
                        DefaultErrorModel* dem = [DefaultErrorModel new];
                        dem.message = [NSString stringWithUTF8String:[data bytes]];
                        serverErr = dem;
                        
                    } else {
                        
                        serverErr = [JsonCoder decodeData:data objectClass: [errorClass class]];
                    }
                    
                    OperationError* err = [OperationError errorWithDomain:@"ServerError" withReason:[serverErr valueForKey:@"message"]];
                    callback(nil, err);
                    
                } @catch (NSException* e) {
                    OperationError* err = [OperationError errorWithDomain:e.name withReason:e.reason];
                    callback(nil, err);
                }
                
            } else {
                OperationError* err = [OperationError errorWithDomain:@"ServerError" withReason: [NSString stringWithFormat:@"Server returned status %ld with no decsription", (long)statusCode]];
                callback(nil, err);
            }
            
        } else {
            
            if (data && [data length]>0) {
                
                @try {
                    
                    id result = nil;
                    
                    if (elementClass != nil) {
                        
                        result = [JsonCoder decodeContainer:data elementClass:elementClass];
                    
                    } else {
                        
                        result = [JsonCoder decodeData:data objectClass:responseClass];
                    }
                    
                    callback(result, nil);
                    
                } @catch (NSException *e) {
                    
                    OperationError* err = [OperationError errorWithDomain:e.name withReason:[e reason]];
                    callback(nil, err);
                    
                }
                
            } else {
                
                OperationError* err = [OperationError errorWithDomain:@"ServerError" withReason:@"Server returned empty body"];
                callback(nil, err);
            }
        
        }
    }];
}

+ (void) executeRequest: (RequestParameters*) rp
         withErrorClass: (nullable Class) errorClass
           withCallback: (void (^)(OperationError*)) callback {
 
    [RequestHelper executeRequest:rp withCallback:^(NSData * data, NSInteger statusCode, NSError* error) {
        
        if (error) {
            OperationError* err = [OperationError errorWithDomain:error.domain withReason: error.localizedDescription];
            callback(err);
            return;
        }
        
        [RequestHelper logResponseBody:data];
        
        if (statusCode >= 400) {
            @try {
                
                if (data && [data length]>0) {
                    id serverErr = [JsonCoder decodeData:data objectClass: [errorClass class]];
                    OperationError* err = [OperationError errorWithDomain:@"ServerError" withReason:[serverErr valueForKey:@"message"]];
                    callback(err);
                    
                } else {
                    OperationError* err = [OperationError errorWithDomain:@"ServerError" withReason: [NSString stringWithFormat:@"Server returned status %ld with no decsription", (long)statusCode]];
                    callback(err);
                }
                
            } @catch (NSException *e) {
                
                OperationError* err = [OperationError errorWithDomain:e.name withReason:[e reason]];
                callback(err);
                
            }
            
        } else {
            @try {
                
                if (data && [data length]>0) {
                    
                    OperationError* err = [OperationError errorWithDomain:@"ServerError" withReason:@"Server returned unexpected body"];
                    callback(err);
                    
                } else {
                    
                    callback(nil);
                }
                
            } @catch (NSException *e) {
                
                OperationError* err = [OperationError errorWithDomain:e.name withReason:[e reason]];
                callback(err);
                
            }
        }
    }];
}

@end
