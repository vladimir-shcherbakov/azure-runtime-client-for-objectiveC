/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "CLX_MyBaseType.h"

@implementation CLX_MyBaseType
- (void)encodeWithCoder:(id<AZCoder>)encoder {

    [encoder encodeObject:self.propB1 forKey:@"propB1"];
    [encoder encodeObject:self.propBH1 forKey:@"helper.propBH1"];
}
- (nullable instancetype)initWithDecoder:(id<AZCoder>)decoder {

    if (self = [super init]) {
        _propB1 = [decoder decodeObjectForKey:@"propB1" objectClass:[NSString class]];
        _propBH1 = [decoder decodeObjectForKey:@"helper.propBH1" objectClass:[NSString class]];
    }
    return self;
}
@end
