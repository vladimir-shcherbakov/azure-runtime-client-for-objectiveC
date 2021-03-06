/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "CLX_ReadonlyObj.h"

@implementation CLX_ReadonlyObj
    - (id) initWithidProperty:(NSString *)idProperty {
        self = [super init];
        if (self) {
            _idProperty = idProperty;
        }
        return self;
    }
- (void)encodeWithCoder:(id<AZCoder>)encoder {

    [encoder encodeObject:self.size forKey:@"size"];
}
- (nullable instancetype)initWithDecoder:(id<AZCoder>)decoder {

    if (self = [super init]) {
        _idProperty = [decoder decodeObjectForKey:@"id" objectClass:[NSString class]];
        _size = [decoder decodeObjectForKey:@"size" objectClass:[AZInteger class]];
    }
    return self;
}
@end
