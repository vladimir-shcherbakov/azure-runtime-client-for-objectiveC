/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
*/

#import <AzureClientRuntime/AzureClientRuntime.h>

/**
 * The CLX_ReadonlyObj model.
 */
@interface CLX_ReadonlyObj : NSObject <AZCodable>
/**
 * The idProperty property.
 */
@property (readonly) NSString *idProperty;
/**
 * The size property.
 */
@property AZInteger *size;
/**
* Creates an instance of CLX_ReadonlyObj class.
*/
- (id) initWithidProperty:(NSString *)idProperty;
@end
