/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "MyDerivedType.h"

@implementation MyDerivedType

- (void)encodeWithCoder:(id<Coder>) encoder {

    [super encodeWithCoder:encoder];
    [encoder encodeObject: self.propD1 forKey: @"propD1"];

}

- (nullable instancetype)initWithDecoder:(id<Coder>)decoder {

    if (self = [super initWithDecoder:decoder]) {

        self.propD1 = [decoder decodeObjectForKey:@"propD1" objectClass:[NSString class]];
    }

    return self;
}

@end