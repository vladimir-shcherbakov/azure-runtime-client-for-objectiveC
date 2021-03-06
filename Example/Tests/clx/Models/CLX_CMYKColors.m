/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "CLX_CMYKColors.h"

/**
 * Defines values for CLX_CMYKColors.
 */
@implementation CLX_CMYKColors
+ (NSArray*)values {
    static NSArray *allValues;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allValues = @[
            @"cyan",
            @"Magenta",
            @"YELLOW",
            @"blacK"
        ];
    });
    return allValues;
}
/** Enum value cyan. */
+ (CLX_CMYKColors*)CYAN {
    return [CLX_CMYKColors values][0];
}
/** Enum value Magenta. */
+ (CLX_CMYKColors*)MAGENTA {
    return [CLX_CMYKColors values][1];
}
/** Enum value YELLOW. */
+ (CLX_CMYKColors*)YELLOW {
    return [CLX_CMYKColors values][2];
}
/** Enum value blacK. */
+ (CLX_CMYKColors*)BLACK {
    return [CLX_CMYKColors values][3];
}
+ (CLX_CMYKColors *)fromString:(NSString *)string {
    return (CLX_CMYKColors *)string;
}
+ (NSString *)toStringValue:(CLX_CMYKColors *)value {
    return (NSString *)value;
}
@end
