//
//  SImpleModel.m
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/4/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import "SimpleModel.h"

@implementation SimpleModel

- (void)encodeWithCoder:(id<Coder>) encoder {

    [encoder encodeObject: self.simpleString forKey: @"simpleString"];
    [encoder encodeObject: self.simpleNumber forKey: @"simpleNumber"];
    
}

- (nullable instancetype)initWithDecoder:(id<Coder>)decoder {
    
    if (self = [super init]) {

        self.simpleString = [decoder decodeObjectForKey:@"simpleString" objectClass:[NSString class]];
        self.simpleNumber = [decoder decodeObjectForKey:@"simpleNumber" objectClass:[NSNumber class]];
    }
    
    return self;
}

@end
