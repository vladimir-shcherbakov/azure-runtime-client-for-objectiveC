//
//  ComplexModel.m
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/4/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import "ComplexModel.h"
#import "SimpleModel.h"

@implementation ComplexModel

- (void)encodeWithCoder:(id<Coder>) encoder {
    
    [super encodeWithCoder:encoder];
    [encoder encodeObject: self.comlexArray forKey: @"comlexArray"];
    [encoder encodeObject: self.complexDict forKey: @"complexDict"];
    [encoder encodeObject: self.complexSimpleModel forKey: @"complexSimpleModel"];
}

- (nullable instancetype)initWithDecoder:(id<Coder>)decoder {
    
    if (self = [super initWithDecoder:decoder]) {
        self.comlexArray = [decoder decodeArrayForKey:@"comlexArray" elementClass:[SimpleModel class]];
        self.complexDict = [decoder decodeDictionaryForKey:@"complexDict" elementClass:[SimpleModel class]];
        self.complexSimpleModel = [decoder decodeObjectForKey:@"complexSimpleModel" objectClass:[SimpleModel class]];
    }
    
    return self;
}

@end
