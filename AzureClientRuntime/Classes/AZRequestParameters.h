//
//  RequestParameters.h
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/2/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AZRequestParameters : NSObject

@property NSString* url;
@property NSString* mehod;
@property NSMutableDictionary* headers;
@property NSData* body;
+ (instancetype)createWithUrl:(NSString*)url withMethod:(NSString*)method withHeaders:(NSDictionary*)headers withBody:(NSData* _Nullable)body;
- (void)withSpecialHeaders:(NSDictionary* _Nullable)headers;

@end

NS_ASSUME_NONNULL_END
