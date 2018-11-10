//
//  RequestHelper.h
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/2/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AZRequestParameters.h"
#import "AZJsonCoder.h"
#import "AZOperationError.h"

NS_ASSUME_NONNULL_BEGIN

@interface AZRequestHelper : NSObject

+ (NSString*)buildUrl:(NSString *)baseUrl
             withPath:(NSString *)path
       withPathParams:(NSDictionary *)pathParams
      withQueryParams:(NSDictionary *)queryParams;

+ (void)executeRequest:(AZRequestParameters*)request
          withCallback:(void (^)(NSData *_Nullable, NSInteger statusCode, NSError *_Nullable)) callback;

/**
 @param responseClass respone type
 @param elementClass if resoponse is an array or dictionary - element type, else - nil
 */
+ (void)executeRequest:(AZRequestParameters *)request
     withResponseClass:(nullable Class)responseClass
      withElementClass:(nullable Class)elementClass
        withErrorClass:(nullable Class)errorClass
          withCallback:(void (^)(id _Nullable, AZOperationError *_Nullable))callback;

+ (void)executeRequest:(AZRequestParameters *)request
     withResponseClass:(nullable Class)responseClass
        withErrorClass:(nullable Class)errorClass
          withCallback:(void (^)(id _Nullable, AZOperationError *_Nullable))callback;

+ (void)executeRequest:(AZRequestParameters *)request
        withErrorClass:(nullable Class)errorClass
          withCallback:(void (^)(AZOperationError*))callback;
@end

NS_ASSUME_NONNULL_END
