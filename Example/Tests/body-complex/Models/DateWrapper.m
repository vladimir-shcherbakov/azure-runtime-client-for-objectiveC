/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "DateWrapper.h"

@implementation DateWrapper

- (void)encodeWithCoder:(id<Coder>) encoder {

    [encoder encodeObject: self.field forKey: @"field"];
    [encoder encodeObject: self.leap forKey: @"leap"];

}

- (nullable instancetype)initWithDecoder:(id<Coder>)decoder {

    if (self = [super init]) {

        self.field = [decoder decodeObjectForKey:@"field" objectClass:[Date class]];
        self.leap = [decoder decodeObjectForKey:@"leap" objectClass:[Date class]];
    }

    return self;
}

@end
