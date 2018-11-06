//
//  RequestHelper.m
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/2/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import "AZRequestHelper.h"
#import "AZJsonCoder.h"
#import "AZDefaultErrorModel.h"
#import "AzureTypes.h"

@interface AZRequestHelper (private)

+ (void) logRequestUrl:(NSString*)url;
+ (void) logRequestBody:(NSData*)body;
+ (void) logResponseBody:(NSData*)body;
//+(NSDictionary*)specialHeaders;
@property (class, readonly) NSDictionary* specialHeaders;

@end

@implementation AZRequestHelper (private)

+(NSDictionary*)specialHeaders {
    static NSDictionary* _specialHeaders;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _specialHeaders = @{@"user-agent":@"AutoRest-ObjectiveC"};
    });
    return _specialHeaders;
}

+(void)logRequestUrl:(NSString*)url {
     NSLog(@"\n<<<< URL: %@", url);
}

+ (void)logRequestBody:(NSData*)body {
    NSString* prefix = @"\n<<<<";
    if (body && body.length > 0) {
        if (body.length<2048) {
            NSError* error;
            id json = [NSJSONSerialization JSONObjectWithData: body
                                                      options: NSJSONReadingAllowFragments
                                                        error: &error];
            if (json != nil) {
                NSLog(@"%@ BODY: %@", prefix, json);
            } else {
                NSString* bodyAsString = [NSString stringWithUTF8String:[body bytes]];
                if (bodyAsString != nil) {
                    NSLog(@"%@ BODY: %@", prefix, bodyAsString);
                } else {
                    NSLog(@"%@ BODY: %@", prefix, body);
                }
            }
        } else {
            NSLog(@"%@ BODY: %lu bytes", prefix, (unsigned long)body.length);
        }
    } else {
        NSLog(@"%@ BODY: <empty>", prefix);
    }
}

+ (void)logResponseBody:(NSData*)body {
    NSString* prefix = @"\n>>>>";
    if (body && body.length > 0) {
        if (body.length<2048) {
            //NSString* bodyAsString = [NSString stringWithUTF8String:[body bytes]];
            NSError* error;
            id json = [NSJSONSerialization JSONObjectWithData: body
                                                      options: NSJSONReadingAllowFragments
                                                        error: &error];
            if (json != nil) {
                NSLog(@"%@ BODY: %@", prefix, json);
            } else {
                NSString* bodyAsString = [NSString stringWithUTF8String:[body bytes]];
                if (bodyAsString != nil)
                    NSLog(@"%@ BODY: %@", prefix, bodyAsString);
                else
                    NSLog(@"%@ BODY: %@", prefix, body);
            }
        } else {
            NSLog(@"%@ BODY: %lu bytes", prefix, (unsigned long)body.length);
        }
    } else {
        NSLog(@"%@ BODY: <empty>", prefix);
    }
}

@end

@implementation AZRequestHelper

+ (NSString*)buildUrl:(NSString*)baseUrl
             withPath:(NSString*)path
       withPathParams:(NSDictionary*)pathParams
      withQueryParams:(NSDictionary*)queryParams {
    
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
                            if ([arr[i] conformsToProtocol:@protocol(AZStringEnum)]
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

+ (void)executeRequest:(AZRequestParameters*)requestParams
           withCallback: (void (^)(NSData* _Nullable, NSInteger statusCode, NSError* _Nullable)) callback {

    [requestParams withSpecialHeaders: AZRequestHelper.specialHeaders];

    NSURL *url = [NSURL URLWithString:requestParams.url];
    [AZRequestHelper logRequestUrl:requestParams.url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = requestParams.mehod;
    for (id key in requestParams.headers) {
        [request setValue:requestParams.headers[key] forHTTPHeaderField:key];
    }
   
    if (requestParams.body) {
        
        [AZRequestHelper logRequestBody:requestParams.body];
        
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

+ (void)executeRequest:(AZRequestParameters*)requestParameters
     withResponseClass:(nullable Class)responseClass
        withErrorClass:(nullable Class)errorClass
          withCallback:(void (^)(id _Nullable, AZOperationError* _Nullable))callback {
    
    [AZRequestHelper executeRequest:requestParameters
                 withResponseClass:responseClass
                  withElementClass:nil
                    withErrorClass:errorClass
                      withCallback:callback];
}

+ (void)executeRequest:(AZRequestParameters*)requestParameters
     withResponseClass:(nullable Class)responseClass
      withElementClass:(nullable Class)elementClass
        withErrorClass:(nullable Class)errorClass
          withCallback:(void (^)(id _Nullable, AZOperationError* _Nullable))callback {
    
    [AZRequestHelper executeRequest:requestParameters withCallback:^(NSData * data, NSInteger statusCode, NSError* error) {
        
        if (error) {
            
            AZOperationError* err = [AZOperationError errorWithDomain:error.domain withReason: error.localizedDescription];
            callback(nil, err);
            return;
        }
        
        [AZRequestHelper logResponseBody:data];
        
        if (statusCode >= 400) {
            
            if (data && [data length]>0) {
                @try {
                    id serverErr;
                    if (errorClass == [AZDefaultErrorModel class]) {
                        
                        AZDefaultErrorModel* dem = [AZDefaultErrorModel new];
                        dem.message = [NSString stringWithUTF8String:[data bytes]];
                        serverErr = dem;
                        
                    } else {
                        
                        serverErr = [AZJsonCoder decodeData:data objectClass: [errorClass class]];
                    }
                    
                    AZOperationError* err = [AZOperationError errorWithDomain:@"ServerError" withReason:[serverErr valueForKey:@"message"]];
                    callback(nil, err);
                    
                } @catch (NSException* e) {
                    AZOperationError* err = [AZOperationError errorWithDomain:e.name withReason:e.reason];
                    callback(nil, err);
                }
                
            } else {
                AZOperationError* err = [AZOperationError errorWithDomain:@"ServerError" withReason: [NSString stringWithFormat:@"Server returned status %ld with no decsription", (long)statusCode]];
                callback(nil, err);
            }
            
        } else {
            
            if (data && [data length]>0) {
                
                @try {
                    
                    id result = nil;
                    
                    if (elementClass != nil) {
                        
                        result = [AZJsonCoder decodeContainer:data elementClass:elementClass];
                    
                    } else {
                        
                        result = [AZJsonCoder decodeData:data objectClass:responseClass];
                    }
                    
                    callback(result, nil);
                    
                } @catch (NSException *e) {
                    
                    AZOperationError* err = [AZOperationError errorWithDomain:e.name withReason:[e reason]];
                    callback(nil, err);
                    
                }
                
            } else {
                
                AZOperationError* err = [AZOperationError errorWithDomain:@"ServerError" withReason:@"Server returned empty body"];
                callback(nil, err);
            }
        
        }
    }];
}

+ (void)executeRequest:(AZRequestParameters*)rp
        withErrorClass:(nullable Class)errorClass
          withCallback:(void (^)(AZOperationError*))callback {
 
    [AZRequestHelper executeRequest:rp withCallback:^(NSData * data, NSInteger statusCode, NSError* error) {
        
        if (error) {
            AZOperationError* err = [AZOperationError errorWithDomain:error.domain withReason: error.localizedDescription];
            callback(err);
            return;
        }
        
        [AZRequestHelper logResponseBody:data];
        
        if (statusCode >= 400) {
            @try {
                
                if (data && [data length]>0) {
                    id serverErr = [AZJsonCoder decodeData:data objectClass: [errorClass class]];
                    AZOperationError* err = [AZOperationError errorWithDomain:@"ServerError" withReason:[serverErr valueForKey:@"message"]];
                    callback(err);
                    
                } else {
                    AZOperationError* err = [AZOperationError errorWithDomain:@"ServerError" withReason: [NSString stringWithFormat:@"Server returned status %ld with no decsription", (long)statusCode]];
                    callback(err);
                }
                
            } @catch (NSException *e) {
                
                AZOperationError* err = [AZOperationError errorWithDomain:e.name withReason:[e reason]];
                callback(err);
                
            }
            
        } else {
            @try {
                
                if (data && [data length]>0) {
                    
                    AZOperationError* err = [AZOperationError errorWithDomain:@"ServerError" withReason:@"Server returned unexpected body"];
                    callback(err);
                    
                } else {
                    
                    callback(nil);
                }
                
            } @catch (NSException *e) {
                
                AZOperationError* err = [AZOperationError errorWithDomain:e.name withReason:[e reason]];
                callback(err);
                
            }
        }
    }];
}

@end
