//
//  JsonCoder.h
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/4/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * encode: object -> dictionary
 * decode: dictionary -> object
 */
@protocol AZCoder
- (void) encodeObject:(nullable id)object forKey:(NSString *)key;
- (nullable id) decodeObjectForKey: (NSString *) key objectClass: (Class) objectClass;
- (nullable id) decodeDictionaryForKey: (NSString *) key elementClass: (nullable Class) elementClass;
- (nullable id) decodeArrayForKey: (NSString *) key elementClass: (nullable Class) elementClass;
@end


NS_ASSUME_NONNULL_END
