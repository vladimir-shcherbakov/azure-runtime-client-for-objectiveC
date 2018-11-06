/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "../Models/CLX_Siamese.h"
@class AZOperationError;

/**
 * An protocol provides access to all CLX_Inheritances operations
 */
@protocol CLX_InheritancesProtocol

/**
 * Get complex types that extend others.
 *
 * @param callback A block where CLX_Siamese is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getValidWithCallback:(void(^)(CLX_Siamese*, AZOperationError*))callback;

/**
 * Put complex types that extend others.
 *
 * @param complexBody Please put a siamese with id=2, name="Siameee", color=green, breed=persion, which hates 2 dogs, the 1st one named "Potato" with id=1 and food="tomato", and the 2nd one named "Tomato" with id=-1 and food="french fries".
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putValidWithComplexBody:(CLX_Siamese *)complexBody withCallback:(void(^)(AZOperationError*))callback;

@end

/**
* The protocol implementation
*/
@class CLX_AutoRestComplexTestServiceService;

@interface CLX_Inheritances : NSObject <CLX_InheritancesProtocol>
@property (readonly) CLX_AutoRestComplexTestServiceService *service;
- (instancetype)initWithService:(CLX_AutoRestComplexTestServiceService *)service;
@end