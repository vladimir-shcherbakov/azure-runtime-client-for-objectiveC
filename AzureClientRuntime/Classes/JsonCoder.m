//
//  JsonCoder.m
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/4/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import "JsonCoder.h"
#import "Codable.h"

@interface JsonCoder (private)

- (instancetype) init;
- (instancetype) initWithDictionary: (NSDictionary *) dict;
+ (NSDictionary*) convertObjectToDictionary: (id<Codable>) codable;
+ (id) serilializeObject: (nullable id)object;
+ (nullable id) deserilializeObject: (nullable id) object forKey: (NSString *)key objectClass: (Class) objectClass;

@end

@implementation JsonCoder (private)

- (instancetype) init {
    
    if (self = [super init]) {
        dd = [NSMutableDictionary new];
    }
    
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dict {
    if (self = [super init]) {
        dd = [[NSMutableDictionary alloc] initWithDictionary:dict];
    }
    
    return self;
}

+ (NSDictionary*) convertObjectToDictionary: (id<Codable>) codable {
    JsonCoder* coder = [JsonCoder new];
    [codable encodeWithCoder:coder];
    return coder->dd;
}

+ (id) serilializeObject: (nullable id)object {
    
    if (object == nil || [object isKindOfClass:[NSNull class]]) {
        
        return [NSNull new];
        
    } else if ([object isKindOfClass:[NSArray class]]) {
        
        NSArray* src = object;
        NSMutableArray* dst = [NSMutableArray new];
        
        for (id item in src) {
            
            [dst addObject:[JsonCoder serilializeObject: item]];
        }
        
        return dst;
        
    } else if ([object isKindOfClass:[NSDictionary class]]) {
        
        NSMutableDictionary* dst = [NSMutableDictionary new];
        NSDictionary* src = object;
        
        for (id key in [src allKeys]) {
            
            [dst setObject:[JsonCoder serilializeObject: src[key]] forKey:key];
        }
        
        return dst;
        
    } else if ([[object class] conformsToProtocol:@protocol(Codable)]) {
        
        return [JsonCoder convertObjectToDictionary:object];
        
    } else if ([[object class] conformsToProtocol:@protocol(AZBoolean)]) {
        
        if ([object getBool]) return @YES;
        else return @NO;
        
    } else if ([object isKindOfClass:[NSData class]]) {
        
        return [object base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];;
        
    } else if ([object isKindOfClass:[NSNumber class]]
               || [object isKindOfClass:[NSString class]]) {
        
        return object;
        
    } else if ([[object class] conformsToProtocol:@protocol(DateString)]) {
        
        return [object toString];
        
    } else {
        
        //return [NSString stringWithFormat:@"%@", object];
        return object;
    }
}

+ (nullable id) deserilializeObject: (nullable id) object
                             forKey: (NSString *)key
                        objectClass: (Class) objectClass {
    
    if (nil == object || [object isKindOfClass:[NSNull class]]) {
        
        return object;
    }
    
    if ([objectClass conformsToProtocol:@protocol(Codable)]) {
        
        JsonCoder* decoder = [[JsonCoder alloc] initWithDictionary:object];
        return [[objectClass alloc] initWithDecoder: decoder];
        
    }
    
    if ([objectClass conformsToProtocol:@protocol(DateString)]) {
        if (![object isKindOfClass:[NSString class]]) {
            @throw [NSException exceptionWithName:@"IncompatiblePointerTypes"
                                           reason:[NSString stringWithFormat:@"For key '%@' incompatible pointer types initializing '%@ *' with an expression of type '%@ *'", key, objectClass, [object  class]]
                                         userInfo:nil];
        }
        
        return [[objectClass alloc] initFromString:object ];
    }
    
    if ([objectClass conformsToProtocol:@protocol(StringEnum)]) {
        if (![object isKindOfClass:[NSString class]]) {
            @throw [NSException exceptionWithName:@"IncompatiblePointerTypes"
                                           reason:[NSString stringWithFormat:@"For key '%@' incompatible pointer types initializing '%@ *' with an expression of type '%@ *'", key, objectClass, [object  class]]
                                         userInfo:nil];
        }
        
        return [objectClass fromString: object ];
    }
    
    if ([objectClass conformsToProtocol:@protocol(AZBoolean)]) {
        if (![object isKindOfClass:[NSNumber class]]) {
            @throw [NSException exceptionWithName:@"IncompatiblePointerTypes"
                                           reason:[NSString stringWithFormat:@"For key '%@' incompatible pointer types initializing '%@ *' with an expression of type '%@ *'", key, objectClass, [object  class]]
                                         userInfo:nil];
        }
        
        NSNumber* val = object ;
        return [[objectClass alloc] initWithBool:[val boolValue]];
    }
    
    if ([objectClass isSubclassOfClass:[NSData class]]) {
        
        return [[NSData alloc]initWithBase64EncodedString:object options:0];
    }
    
    if ([objectClass isSubclassOfClass:[NSUUID class]]) {
        
        return [[NSUUID alloc]initWithUUIDString:object];
    }
    
    if (![object isKindOfClass:objectClass]) {
        @throw [NSException exceptionWithName:@"IncompatiblePointerTypes"
                                       reason:[NSString stringWithFormat:@"For key '%@' incompatible pointer types initializing '%@ *' with an expression of type '%@ *'", key, objectClass, [object  class]]
                                     userInfo:nil];
    }
    
    return object;
}

@end

@implementation JsonCoder

//NSString* str = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];


+ (NSData*) encodeObject: (id) object {
    
    id so = [JsonCoder serilializeObject: object];
    
    if ([object isKindOfClass:[NSArray class]]
        || [object isKindOfClass:[NSArray class]]
        || [object conformsToProtocol:@protocol(Codable)]) {
        
        
        if (@available(iOS 11.0, *)) {
            NSError* error;
            NSData* jsonData = [NSJSONSerialization dataWithJSONObject: so
                                                               options: NSJSONWritingSortedKeys
                                                                 error: &error];
            if (error) {
                
                @throw [NSException exceptionWithName:@"JsonEncoding"
                                               reason:error.localizedDescription
                                             userInfo:error.userInfo];
            }
            
            return jsonData;
        } else {
            @throw [NSException exceptionWithName:@"UnsupportedIOSVersion"
                                           reason:@"NSJSONWritingSortedKeys' is only available on iOS 11.0 or newer"
                                         userInfo:nil];
        }
    }
    
    return [so dataUsingEncoding:NSUTF8StringEncoding];
}

+ (nullable id) decodeContainer: (NSData*) jsonData
                   elementClass: (Class) elementClass {
    
    NSError* error;
    
    id json = [NSJSONSerialization JSONObjectWithData: jsonData
                                              options: NSJSONReadingAllowFragments
                                                error: &error];
    
    if (error) {
        
        @throw [NSException exceptionWithName:@"JsonDecoding" reason:error.localizedDescription userInfo:error.userInfo];
    }
    
//    if ([elementClass isSubclassOfClass:[NSNumber class]]
//        || [elementClass isSubclassOfClass:[NSString class]]
//        || [json count] == 0) {
    if ([json count] == 0) {
    
        return json;
    }
    
    if ([json isKindOfClass:[NSArray class]]) {
        
        NSArray* src = json;
        NSMutableArray* dst = [NSMutableArray new];
        
        for (id item in src) {
            
            [dst addObject: [JsonCoder deserilializeObject:item
                                                    forKey:@"BODY"
                                               objectClass:elementClass]];
//            if ([elementClass conformsToProtocol:@protocol(Codable)]) {
//
//                JsonCoder* decoder = [[JsonCoder alloc] initWithDictionary:val];
//                [dst addObject: [[elementClass alloc] initWithDecoder:decoder]];
//
//            } else if ([elementClass conformsToProtocol:@protocol(AZBoolean)]) {
//
//                [dst addObject: [((NSNumber*)val) boolValue]
//                    ? [AZBoolean asTrue]
//                    : [AZBoolean asFalse]];
//
//
//            } else if ([elementClass conformsToProtocol:@protocol(DateString)]) {
//
//                [dst addObject: [[elementClass alloc] initFromString: val]];
//
//            } else if ([elementClass conformsToProtocol:@protocol(StringEnum)]) {
//
//                [dst addObject: [elementClass fromString:val]];
//            }
            
        }
        
        return dst;
        
        
    } else if ([json isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary* src = json;
        NSMutableArray* dst = [NSMutableArray new];
        
        for (id item in [src allKeys]) {
            
            [dst addObject: [JsonCoder deserilializeObject: src[item]
                                                    forKey:@"BODY"
                                               objectClass:elementClass]];
        }
        
        return dst;
        
    } else {
        
        @throw [NSException exceptionWithName:@"JsonDecoding"
                                       reason:@"json object is not a container"
                                     userInfo:nil];
    }
    
    return json;
}

+ (nullable id) decodeData: (NSData*) jsonData
               objectClass: (Class) objectClass {
    
    
    if ([objectClass isSubclassOfClass:[NSData class]]) {
        
        return [NSData dataWithData:jsonData];
        
    }
    
    NSError* error;
    
    id json = [NSJSONSerialization JSONObjectWithData: jsonData
                                              options: NSJSONReadingAllowFragments
                                                error: &error];
    
    if (error) {
        
        @throw [NSException exceptionWithName:@"JsonDecoding"
                                       reason:error.localizedDescription
                                     userInfo:nil];
    }
    
    return [JsonCoder deserilializeObject:json
                                   forKey:@"BODY"
                              objectClass:objectClass];
//    if ([objectClass conformsToProtocol:@protocol(Codable)]) {
//
//        JsonCoder* decoder = [[JsonCoder alloc] initWithDictionary:json];
//
//        return [[objectClass alloc] initWithDecoder:decoder];
//
//    }
//
//    if ([objectClass conformsToProtocol:@protocol(DateString)]) {
//
//        return [[objectClass alloc] initWithString:json];
//
//    }
//
//    if ([objectClass conformsToProtocol:@protocol(AZBoolean)]) {
//
//        return [((NSNumber*)json) boolValue]
//            ? [AZBoolean asTrue]
//            : [AZBoolean asFalse];
//
//    }
//
//    if ([objectClass conformsToProtocol:@protocol(StringEnum)]) {
//
//        return [objectClass fromString:json];
//    }
//
//    return json;
}


// From Coder protocol
- (void) encodeObject: (nullable id)object
               forKey: (NSString *)key {
    
    dd[key] = [JsonCoder serilializeObject:object];
}

//NSError *error;
// encoding
//NSData* jsonData = [NSJSONSerialization dataWithJSONObject : dict  options:NSJSONWritingSortedKeys error : &error];
// decoding
//id arrayOrDict = [NSJSONSerialization JSONObjectWithData : jsonData options : NSJSONReadingAllowFragments error : &error];

// From Coder protocol
- (nullable id) decodeObjectForKey: (NSString *) key
                       objectClass: (Class) objectClass {
    
    return [JsonCoder deserilializeObject:dd[key]
                                   forKey:key
                              objectClass:objectClass];
//    if (nil == dd[key] || [dd[key]isKindOfClass:[NSNull class]]) {
//
//        return nil;
//    }
//
//    if ([objectClass conformsToProtocol:@protocol(Codable)]) {
//
//        JsonCoder* decoder = [[JsonCoder alloc] initWithDictionary:dd[key]];
//        return [[objectClass alloc] initWithDecoder: decoder];
//
//    }
//
//    if ([objectClass conformsToProtocol:@protocol(DateString)]) {
//        if (![dd[key]isKindOfClass:[NSString class]]) {
//            @throw [NSException exceptionWithName:@"IncompatiblePointerTypes"
//                                           reason:[NSString stringWithFormat:@"For key '%@' incompatible pointer types initializing '%@ *' with an expression of type '%@ *'", key, objectClass, [dd[key] class]]
//                                         userInfo:nil];
//        }
//
//        return [[objectClass alloc] initFromString:dd[key]];
//    }
//
//    if ([objectClass conformsToProtocol:@protocol(StringEnum)]) {
//        if (![dd[key]isKindOfClass:[NSString class]]) {
//            @throw [NSException exceptionWithName:@"IncompatiblePointerTypes"
//                                           reason:[NSString stringWithFormat:@"For key '%@' incompatible pointer types initializing '%@ *' with an expression of type '%@ *'", key, objectClass, [dd[key] class]]
//                                         userInfo:nil];
//        }
//
//        return [objectClass fromString: dd[key]];
//    }
//
//    if ([objectClass conformsToProtocol:@protocol(AZBoolean)]) {
//        if (![dd[key]isKindOfClass:[NSNumber class]]) {
//            @throw [NSException exceptionWithName:@"IncompatiblePointerTypes"
//                                           reason:[NSString stringWithFormat:@"For key '%@' incompatible pointer types initializing '%@ *' with an expression of type '%@ *'", key, objectClass, [dd[key] class]]
//                                         userInfo:nil];
//        }
//
//        NSNumber* val = dd[key];
//        return [[objectClass alloc] initWithBool:[val boolValue]];
//    }
//
//    if ([objectClass isEqual:[NSData class]]) {
//
//        return [[NSData alloc]initWithBase64EncodedString:dd[key] options:0];
//    }
//
//    if (![dd[key]isKindOfClass:objectClass]) {
//        @throw [NSException exceptionWithName:@"IncompatiblePointerTypes"
//                                       reason:[NSString stringWithFormat:@"For key '%@' incompatible pointer types initializing '%@ *' with an expression of type '%@ *'", key, objectClass, [dd[key] class]]
//                                     userInfo:nil];
//    }
//
//    return dd[key];
}

- (nullable id) decodeDictionaryForKey: (NSString *) key
                          elementClass: (nullable Class) elementClass {
    
    if (nil == dd[key]) {
        return nil;
    }
    
    if (![dd[key] isKindOfClass:[NSDictionary class]]) {
        
        @throw [NSException
                exceptionWithName:@"IncorrectDecodingMethod"
                reason:@"You are trying to decode an element which is not an array with the 'decodeDictionaryForKey:elementClass:' method" userInfo:nil];
    }
    
    // container with elements of objc types
//    if (elementClass == nil) {
//        return dd[key];
//    }
    
//    if ([elementClass conformsToProtocol:@protocol(Codable)]) {
//
//        NSDictionary* dict = dd[key];
//        NSArray* keys = [dict allKeys];
//        NSMutableDictionary* dst = [NSMutableDictionary new];
//
//        for (int i=0; i<[keys count]; i++) {
//            NSString* k = keys[i];
//            JsonCoder* decoder = [[JsonCoder alloc] initWithDictionary:dict[k]];
//            id value = [[elementClass alloc] initWithDecoder: decoder];
//            [dst setObject:value forKey:k];
//        }
//
//        return dst;
//     }
   
    NSDictionary* src = dd[key];
    NSMutableDictionary* dst = [NSMutableDictionary new];

    for (id key in [src allKeys]) {
        [dst setObject:[JsonCoder deserilializeObject:src[key]
                                               forKey:key objectClass:elementClass]
                forKey:key];
    }

    return dst;
}

- (nullable id) decodeArrayForKey: (NSString *) key
                     elementClass: (nullable Class) elementClass {
    
    if (nil == dd[key]) {

        return nil;
    }
    
     if (![dd[key] isKindOfClass:[NSArray class]]) {
     
        @throw [NSException
                exceptionWithName:@"IncorrectDecodingMethod"
                reason:@"You are trying to decode an element which is not an array with the 'decodeArrayForKey:elementClass:' method" userInfo:nil];
    }
    
//// container with elements of objc types
//    if ([elementClass isSubclassOfClass:[NSString class]]
//        || [elementClass isSubclassOfClass:[NSNub class]) {
//        return dd[key];
//    }
    
    NSArray* src = dd[key];
    NSMutableArray* dst = [NSMutableArray new];
    
    for (id item in src) {
        
        [dst addObject: [JsonCoder deserilializeObject:item
                                                forKey:key
                                           objectClass:elementClass]];
    }
    
    return dst;
//    if ([elementClass conformsToProtocol:@protocol(Codable)]) {
//
//        NSArray* arr = dd[key];
//        NSMutableArray* dst = [NSMutableArray new];
//
//        for (int i=0; i<[arr count]; i++) {
//            JsonCoder* decoder = [[JsonCoder alloc] initWithDictionary:arr[i]];
//            id item = [[elementClass alloc] initWithDecoder: decoder];
//            [dst addObject:item];
//        }
//
//        return dst;
//    }
    
//    return  dd[key];
}

@end
