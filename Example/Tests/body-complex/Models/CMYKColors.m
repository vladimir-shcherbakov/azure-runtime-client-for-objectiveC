/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "CMYKColors.h"

/**
 * Defines values for CMYKColors.
 */
@implementation CMYKColors

    + (NSArray*) values {

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
    static CMYKColors* _CYAN = (CMYKColors*)@"cyan";

    + (CMYKColors*) CYAN {
        return _CYAN;
    }

    /** Enum value Magenta. */
    static CMYKColors* _MAGENTA = (CMYKColors*)@"Magenta";

    + (CMYKColors*) MAGENTA {
        return _MAGENTA;
    }

    /** Enum value YELLOW. */
    static CMYKColors* _YELLOW = (CMYKColors*)@"YELLOW";

    + (CMYKColors*) YELLOW {
        return _YELLOW;
    }

    /** Enum value blacK. */
    static CMYKColors* _BLACK = (CMYKColors*)@"blacK";

    + (CMYKColors*) BLACK {
        return _BLACK;
    }

    + (CMYKColors *) fromString: (NSString *) string {
        return (CMYKColors *) string;
    }

    + (NSString *) toStringValue: (id<StringEnum>) value {

        return (NSString *) value;
    }

@end