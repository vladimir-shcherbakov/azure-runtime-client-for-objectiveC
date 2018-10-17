//
//  JsonCoder.h
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/4/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coder.h"

NS_ASSUME_NONNULL_BEGIN

@interface JsonCoder : NSObject <Coder>
{
    @private NSMutableDictionary* dd;
}

+ (NSData*) encodeObject: (id) codable;
+ (nullable id) decodeData: (NSData*) jsonData objectClass: (Class) objectClass;
+ (nullable id) decodeContainer: (NSData*) jsonData elementClass: (Class) elementClass;

@end

NS_ASSUME_NONNULL_END
