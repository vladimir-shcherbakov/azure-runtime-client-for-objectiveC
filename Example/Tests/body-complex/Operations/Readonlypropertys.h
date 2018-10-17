/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "../Models/ReadonlyObj.h"
@class OperationError;

/**
 * An protocol provides access to all Readonlypropertys operations
 */
@protocol ReadonlypropertysProtocol

    /**
     * Get complex types that have readonly properties.
     *
     * @param callback A block where ReadonlyObj is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getValidWithCallback : (void(^)(ReadonlyObj*, OperationError*)) callback;

    /**
     * Put complex types that have readonly properties.
     *
     * @param complexBody the ReadonlyObj value
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a required parameter is not provided.
     */
    - (void) putValidWithComplexBody : (ReadonlyObj *) complexBody withCallback : (void(^)(OperationError*)) callback;

@end

/**
* The protocol implementation
*/
@class AutoRestComplexTestService;

@interface Readonlypropertys : NSObject <ReadonlypropertysProtocol>
@property (readonly) AutoRestComplexTestService* service;
- (instancetype) initWithService: (AutoRestComplexTestService *) service;
@end