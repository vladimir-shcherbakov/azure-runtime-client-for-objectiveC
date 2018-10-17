//
//  AzureTypes.h
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/10/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSNumber AZDouble;
typedef NSNumber AZFloat;
typedef NSNumber AZInteger;
typedef NSNumber AZLong;
typedef NSData AZByteArray;
typedef NSDate AZTimeSpan;
typedef NSData AZStream;
typedef NSString AZBase64Url;




@protocol AZBoolean <NSObject>

- (instancetype) initWithBool: (BOOL) val;
-(BOOL) getBool;

@end

@interface AZBoolean : NSObject <AZBoolean>
{
    BOOL _val;
}

- (NSNumber*) asNSNumber;
- (instancetype) initWithTRUE;
- (instancetype) initWithFALSE;
+ (instancetype) asTrue;
+ (instancetype) asFalse;

@end

@interface NSString (base64)

- (NSString*) base64Decoded;
- (NSString*) base64UrlDecoded;

@end


NS_ASSUME_NONNULL_END
