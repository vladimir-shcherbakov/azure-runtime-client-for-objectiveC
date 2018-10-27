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

+(void) logRequestUrl: (NSString*) url;
+(void) logRequestBody: (NSData*) body;
+(void) logResponseBody: (NSData*) body;
//+(NSDictionary*)specialHeaders;
@property (class, readonly) NSDictionary* specialHeaders;

@end

@implementation RequestHelper (private)

+(NSDictionary*)specialHeaders {
    static NSDictionary* _specialHeaders;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _specialHeaders = @{@"user-agent":@"AutoRest-ObjectiveC"};
    });
    return _specialHeaders;
}

+(void) logRequestUrl: (NSString*) url {
     NSLog(@"\n<<<< request url: %@", url);
}

+ (void) logRequestBody: (NSData*) body {
    NSString* prefix = @"\n<<<<";
    if (body && body.length > 0) {
        if (body.length<2048) {
            NSString* bodyAsString = [NSString stringWithUTF8String:[body bytes]];
            if (bodyAsString != nil) {
                NSLog(@"%@ request body: %@", prefix, bodyAsString);
            } else {
                NSLog(@"%@ request body: %@", prefix, body);
            }
        } else {
            NSLog(@"%@ request body: %lu bytes", prefix, (unsigned long)body.length);
        }
    } else {
        NSLog(@"%@ request body: <empty>", prefix);
    }
}

+ (void) logResponseBody: (NSData*) body {
    NSString* prefix = @"\n>>>>";
    if (body && body.length > 0) {
        if (body.length<2048) {
            //NSString* bodyAsString = [NSString stringWithUTF8String:[body bytes]];
            NSError* error;
            id json = [NSJSONSerialization JSONObjectWithData: body
                                                      options: NSJSONReadingAllowFragments
                                                        error: &error];
            if (json != nil) {
                NSLog(@"%@ response body: %@", prefix, json);
            } else {
                NSString* bodyAsString = [NSString stringWithUTF8String:[body bytes]];
                if (bodyAsString != nil)
                    NSLog(@"%@ response body: %@", prefix, bodyAsString);
                else
                    NSLog(@"%@ esponse body: %@", prefix, body);
            }
        } else {
            NSLog(@"%@ response body: %lu bytes", prefix, (unsigned long)body.length);
        }
    } else {
        NSLog(@"%@ response body: <empty>", prefix);
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
        fullPath = [fullPath stringByReplacingOccurrencesOfString:key
                                                       withString:value];
    }
    
    if (queryParams.count > 0) {
        NSMutableArray * queries = [[NSMutableArray alloc] init];
        for (id key in [queryParams allKeys]) {
            id value = queryParams[key];
            if (![value isEqual:[NSNull null]]) {
                if ([value isKindOfClass:[NSArray class]]) {
                    NSArray* arr = value;
                    if (arr.count > 0) {
                        NSString *joined = arr[0];
                        for (int i=1; i<arr.count; i++) {
                            if ([arr[i] conformsToProtocol:@protocol(StringEnum)]
                                || [arr[i] isKindOfClass:[NSString class]]) {
                                joined = [joined stringByAppendingString: [@","stringByAppendingString:arr[i]]];
                            } else {
                                @throw [NSException
                                        exceptionWithName:@"NotStringValue"
                                        reason: [NSString stringWithFormat: @"Don't know to convert to string a query parameter for the key %@", key]
                                        userInfo:nil];
                            }
                        }
                        [queries addObject: [NSString stringWithFormat:@"%@=%@", key, joined]];
                    }
                } else if ([value conformsToProtocol:@protocol(AZBoolean)]) {
                    NSString* boolString = [value getBool] ? @"true" : @"false";
                    [queries addObject: [NSString stringWithFormat:@"%@=%@", key, boolString]];
                } else {
                    [queries addObject: [NSString stringWithFormat:@"%@=%@", key, value]];
                }
            }
        }

        fullPath = [NSString stringWithFormat: @"%@?%@", fullPath, [queries componentsJoinedByString:@"&"]];
    }
    
    return fullPath;
}

+ (void) executeRequest: (RequestParameters*) requestParams
           withCallback: (void (^)(NSData* _Nullable, NSInteger statusCode, NSError* _Nullable)) callback {

    [requestParams withSpecialHeaders: RequestHelper.specialHeaders];

    NSURL *url = [NSURL URLWithString:requestParams.url];
    [RequestHelper logRequestUrl:requestParams.url];
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
