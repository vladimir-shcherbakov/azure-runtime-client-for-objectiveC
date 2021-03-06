/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "CLX_Cat.h"

@implementation CLX_Cat
- (void)encodeWithCoder:(id<AZCoder>)encoder {

    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.color forKey:@"color"];
    [encoder encodeObject:self.hates forKey:@"hates"];
}
- (nullable instancetype)initWithDecoder:(id<AZCoder>)decoder {

    if (self = [super initWithDecoder:decoder]) {
        _color = [decoder decodeObjectForKey:@"color" objectClass:[NSString class]];
        _hates = [decoder decodeArrayForKey:@"hates" elementClass:[CLX_Dog class]];
    }
    return self;
}
@end
