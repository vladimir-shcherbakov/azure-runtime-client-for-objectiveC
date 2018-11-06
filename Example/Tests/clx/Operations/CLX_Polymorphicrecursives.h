/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "CLX_Fish.h"
@class AZOperationError;

/**
 * An protocol provides access to all CLX_Polymorphicrecursives operations
 */
@protocol CLX_PolymorphicrecursivesProtocol

/**
 * Get complex types that are polymorphic and have recursive references.
 *
 * @param callback A block where CLX_Fish is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getValidWithCallback:(void(^)(CLX_Fish*, AZOperationError*))callback;

/**
 * Put complex types that are polymorphic and have recursive references.
 *
 * @param complexBody Please put a salmon that looks like this:
 {
     "fishtype": "salmon",
     "species": "king",
     "length": 1,
     "age": 1,
     "location": "alaska",
     "iswild": true,
     "siblings": [
         {
             "fishtype": "shark",
             "species": "predator",
             "length": 20,
             "age": 6,
             "siblings": [
                 {
                     "fishtype": "salmon",
                     "species": "coho",
                     "length": 2,
                     "age": 2,
                     "location": "atlantic",
                     "iswild": true,
                     "siblings": [
                         {
                             "fishtype": "shark",
                             "species": "predator",
                             "length": 20,
                             "age": 6
                         },
                         {
                             "fishtype": "sawshark",
                             "species": "dangerous",
                             "length": 10,
                             "age": 105
                         }
                     ]
                 },
                 {
                     "fishtype": "sawshark",
                     "species": "dangerous",
                     "length": 10,
                     "age": 105
                 }
             ]
         },
         {
             "fishtype": "sawshark",
             "species": "dangerous",
             "length": 10,
             "age": 105
         }
     ]
 }
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putValidWithComplexBody:(CLX_Fish *)complexBody withCallback:(void(^)(AZOperationError*))callback;

@end

/**
* The protocol implementation
*/
@class CLX_AutoRestComplexTestServiceService;

@interface CLX_Polymorphicrecursives : NSObject <CLX_PolymorphicrecursivesProtocol>
@property (readonly) CLX_AutoRestComplexTestServiceService *service;
- (instancetype)initWithService:(CLX_AutoRestComplexTestServiceService *)service;
@end
