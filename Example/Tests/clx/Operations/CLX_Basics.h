/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "../Models/CLX_Basic.h"
@class AZOperationError;

/**
 * An protocol provides access to all CLX_Basics operations
 */
@protocol CLX_BasicsProtocol

/**
 * Get complex type {id: 2, name: 'abc', color: 'YELLOW'}.
 *
 * @param callback A block where CLX_Basic is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getValidWithCallback:(void(^)(CLX_Basic*, AZOperationError*))callback;

/**
 * Please put {id: 2, name: 'abc', color: 'Magenta'}.
 *
 * @param complexBody Please put {id: 2, name: 'abc', color: 'Magenta'}
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putValidWithComplexBody:(CLX_Basic *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Get a basic complex type that is invalid for the local strong type.
 *
 * @param callback A block where CLX_Basic is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getInvalidWithCallback:(void(^)(CLX_Basic*, AZOperationError*))callback;

/**
 * Get a basic complex type that is empty.
 *
 * @param callback A block where CLX_Basic is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getEmptyWithCallback:(void(^)(CLX_Basic*, AZOperationError*))callback;

/**
 * Get a basic complex type whose properties are null.
 *
 * @param callback A block where CLX_Basic is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getNullWithCallback:(void(^)(CLX_Basic*, AZOperationError*))callback;

/**
 * Get a basic complex type while the server doesn't provide a response payload.
 *
 * @param callback A block where CLX_Basic is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getNotProvidedWithCallback:(void(^)(CLX_Basic*, AZOperationError*))callback;

@end

/**
* The protocol implementation
*/
@class CLX_AutoRestComplexTestServiceService;

@interface CLX_Basics : NSObject <CLX_BasicsProtocol>
@property (readonly) CLX_AutoRestComplexTestServiceService *service;
- (instancetype)initWithService:(CLX_AutoRestComplexTestServiceService *)service;
@end
