//
//  BaseModel.m
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/4/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (void)encodeWithCoder:(id<AZCoder>) encoder {
    
    [encoder encodeObject: self.baseNumber forKey: @"baseNumber"];
    [encoder encodeObject: self.baseString forKey: @"baseString"];
    [encoder encodeObject: self.baseArray forKey: @"baseArray"];
    [encoder encodeObject: self.baseDict forKey: @"baseDict"];
    [encoder encodeObject: self.baseSimpleModel forKey: @"baseSimpleModel"];
    
}

- (nullable instancetype)initWithDecoder:(id<AZCoder>)decoder {
    
    if (self = [super init]) {
        
        self.baseString = [decoder decodeObjectForKey:@"baseString" objectClass:[NSString class]];
        self.baseNumber = [decoder decodeObjectForKey:@"baseNumber" objectClass:[NSNumber class]];
        self.baseSimpleModel = [decoder decodeObjectForKey:@"baseSimpleModel" objectClass:[SimpleModel class]];
        
        self.baseArray = [decoder decodeArrayForKey:@"baseArray" elementClass:[SimpleModel class]];
        self.baseDict = [decoder decodeDictionaryForKey:@"baseDict" elementClass:[SimpleModel class]];
    }
    
    return self;
}

@end
