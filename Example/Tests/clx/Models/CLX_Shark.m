/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "CLX_Shark.h"

@implementation CLX_Shark
    - (id) initWithbirthday:(AZDateTime *)birthday {
        self = [super init];
        if (self) {
            _birthday = birthday;
        }
        return self;
    }
- (void)encodeWithCoder:(id<AZCoder>)encoder {

    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.age forKey:@"age"];
    [encoder encodeObject:self.birthday forKey:@"birthday"];
}
- (nullable instancetype)initWithDecoder:(id<AZCoder>)decoder {

    if (self = [super initWithDecoder:decoder]) {
        _age = [decoder decodeObjectForKey:@"age" objectClass:[AZInteger class]];
        _birthday = [decoder decodeObjectForKey:@"birthday" objectClass:[AZDateTime class]];
    }
    return self;
}
@end