/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "CLX_Fish.h"
#import "CLX_Salmon.h"
@class AZOperationError;

/**
 * An protocol provides access to all CLX_Polymorphisms operations
 */
@protocol CLX_PolymorphismsProtocol

/**
 * Get complex types that are polymorphic.
 *
 * @param callback A block where CLX_Fish is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getValidWithCallback:(void(^)(CLX_Fish*, AZOperationError*))callback;

/**
 * Put complex types that are polymorphic.
 *
 * @param complexBody Please put a salmon that looks like this:
 {
         'fishtype':'Salmon',
         'location':'alaska',
         'iswild':true,
         'species':'king',
         'length':1.0,
         'siblings':[
           {
             'fishtype':'Shark',
             'age':6,
             'birthday': '2012-01-05T01:00:00Z',
             'length':20.0,
             'species':'predator',
           },
           {
             'fishtype':'Sawshark',
             'age':105,
             'birthday': '1900-01-05T01:00:00Z',
             'length':10.0,
             'picture': new Buffer([255, 255, 255, 255, 254]).toString('base64'),
             'species':'dangerous',
           },
           {
             'fishtype': 'goblin',
             'age': 1,
             'birthday': '2015-08-08T00:00:00Z',
             'length': 30.0,
             'species': 'scary',
             'jawsize': 5
           }
         ]
       };
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putValidWithComplexBody:(CLX_Fish *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Get complex types that are polymorphic, but not at the root of the hierarchy; also have additional properties.
 *
 * @param callback A block where CLX_Salmon is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getComplicatedWithCallback:(void(^)(CLX_Salmon*, AZOperationError*))callback;

/**
 * Put complex types that are polymorphic, but not at the root of the hierarchy; also have additional properties.
 *
 * @param complexBody the CLX_Salmon value
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putComplicatedWithComplexBody:(CLX_Salmon *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Put complex types that are polymorphic, omitting the discriminator.
 *
 * @param complexBody the CLX_Salmon value
 * @param callback A block where CLX_Salmon is a result object and AZOperationError is nil, if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putMissingDiscriminatorWithComplexBody:(CLX_Salmon *)complexBody withCallback:(void(^)(CLX_Salmon*, AZOperationError*))callback;

/**
 * Put complex types that are polymorphic, attempting to omit required 'birthday' field - the request should not be allowed from the client.
 *
 * @param complexBody Please attempt put a sawshark that looks like this, the client should not allow this data to be sent:
 {
     "fishtype": "sawshark",
     "species": "snaggle toothed",
     "length": 18.5,
     "age": 2,
     "birthday": "2013-06-01T01:00:00Z",
     "location": "alaska",
     "picture": base64(FF FF FF FF FE),
     "siblings": [
         {
             "fishtype": "shark",
             "species": "predator",
             "birthday": "2012-01-05T01:00:00Z",
             "length": 20,
             "age": 6
         },
         {
             "fishtype": "sawshark",
             "species": "dangerous",
             "picture": base64(FF FF FF FF FE),
             "length": 10,
             "age": 105
         }
     ]
 }
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putValidMissingRequiredWithComplexBody:(CLX_Fish *)complexBody withCallback:(void(^)(AZOperationError*))callback;

@end

/**
* The protocol implementation
*/
@class CLX_AutoRestComplexTestServiceService;

@interface CLX_Polymorphisms : NSObject <CLX_PolymorphismsProtocol>
@property (readonly) CLX_AutoRestComplexTestServiceService *service;
- (instancetype)initWithService:(CLX_AutoRestComplexTestServiceService *)service;
@end
