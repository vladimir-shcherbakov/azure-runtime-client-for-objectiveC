//
//  AzureTypes.m
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/10/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import "AzureTypes.h"

@implementation AZBoolean
- (instancetype)initWithBool:(BOOL)val {
    if (self = [super init]){
        _val = val;
    }
    return self;
}
-(BOOL)getBool {
    return _val;
}
- (NSNumber*)asNSNumber {
    return _val ? @YES : @NO;
}
- (instancetype)initWithTRUE {
    return [self initWithBool:TRUE];
}
- (instancetype)initWithFALSE {
    return [self initWithBool:FALSE];
}
+ (instancetype)asTrue {
    return [[AZBoolean alloc]initWithTRUE];
}
+ (instancetype) asFalse {
    return [[AZBoolean alloc]initWithFALSE];
}
@end

@implementation NSString (base64)
- (NSString *)base64Decoded {
    // NSData from the Base64 encoded str
    NSData *dataFromBase64String = [[NSData alloc] initWithBase64EncodedString:self options:0];    
    // Decoded NSString from the NSData
    if (dataFromBase64String) return [[NSString alloc] initWithData:dataFromBase64String encoding:NSUTF8StringEncoding];
    return nil;
}
- (NSString *)base64UrlDecoded {
    NSString *base64String = [self stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    base64String = [base64String stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    if (base64String.length%4 != 0) {
        NSString *suffix = [@"" stringByPaddingToLength: 4-base64String.length%4 withString: @"=" startingAtIndex:0];
        base64String = [base64String stringByAppendingString:suffix];
    }
    return [base64String base64Decoded];
}
@end
