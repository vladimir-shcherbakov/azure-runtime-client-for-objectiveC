/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "CLX_Datetimerfc1123Wrapper.h"

@implementation CLX_Datetimerfc1123Wrapper
- (void)encodeWithCoder:(id<AZCoder>)encoder {

    [encoder encodeObject:self.field forKey:@"field"];
    [encoder encodeObject:self.now forKey:@"now"];
}
- (nullable instancetype)initWithDecoder:(id<AZCoder>)decoder {

    if (self = [super init]) {
        _field = [decoder decodeObjectForKey:@"field" objectClass:[AZDateTimeRfc1123 class]];
        _now = [decoder decodeObjectForKey:@"now" objectClass:[AZDateTimeRfc1123 class]];
    }
    return self;
}
@end