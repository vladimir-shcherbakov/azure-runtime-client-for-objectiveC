/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "CLX_Sawshark.h"

@implementation CLX_Sawshark
- (void)encodeWithCoder:(id<AZCoder>)encoder {

    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.picture forKey:@"picture"];
}
- (nullable instancetype)initWithDecoder:(id<AZCoder>)decoder {

    if (self = [super initWithDecoder:decoder]) {
        _picture = [decoder decodeObjectForKey:@"picture" objectClass:[AZByteArray class]];
    }
    return self;
}
@end