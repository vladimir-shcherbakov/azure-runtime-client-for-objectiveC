//
//  AZTestError.m
//  AzureClientRuntime_Tests
//
//  Created by Vladimir Shcherbakov on 11/10/18.
//  Copyright © 2018 vladimir-shcherbakov. All rights reserved.
//

#import "AZTestError.h"

@implementation AZTestErrorBase
- (void)encodeWithCoder:(id<AZCoder>)encoder {
    
    [encoder encodeObject:self.code forKey:@"code"];
    [encoder encodeObject:self.message1 forKey:@"message"];
}
- (nullable instancetype)initWithDecoder:(id<AZCoder>)decoder {
    
    if (self = [super init]) {
        _code = [decoder decodeObjectForKey:@"code" objectClass:[NSString class]];
        _message1 = [decoder decodeObjectForKey:@"message" objectClass:[NSString class]];
    }
    return self;
}
@end

@implementation AZTestError
- (void)encodeWithCoder:(id<AZCoder>)encoder {
    
    [encoder encodeObject:self.error forKey:@"error"];
}
- (nullable instancetype)initWithDecoder:(id<AZCoder>)decoder {
    
    if (self = [super init]) {
        _error = [decoder decodeObjectForKey:@"error" objectClass:[AZTestErrorBase class]];
    }
    return self;
}
@end
