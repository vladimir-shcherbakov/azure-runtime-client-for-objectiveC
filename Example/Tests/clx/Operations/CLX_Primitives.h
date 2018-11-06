/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "CLX_BooleanWrapper.h"
#import "CLX_ByteWrapper.h"
#import "CLX_Datetimerfc1123Wrapper.h"
#import "CLX_DatetimeWrapper.h"
#import "CLX_DateWrapper.h"
#import "CLX_DoubleWrapper.h"
#import "CLX_DurationWrapper.h"
#import "CLX_FloatWrapper.h"
#import "CLX_IntWrapper.h"
#import "CLX_LongWrapper.h"
#import "CLX_StringWrapper.h"
@class AZOperationError;

/**
 * An protocol provides access to all CLX_Primitives operations
 */
@protocol CLX_PrimitivesProtocol

/**
 * Get complex types with integer properties.
 *
 * @param callback A block where CLX_IntWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getIntWithCallback:(void(^)(CLX_IntWrapper*, AZOperationError*))callback;

/**
 * Put complex types with integer properties.
 *
 * @param complexBody Please put -1 and 2
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putIntWithComplexBody:(CLX_IntWrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Get complex types with long properties.
 *
 * @param callback A block where CLX_LongWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getLongWithCallback:(void(^)(CLX_LongWrapper*, AZOperationError*))callback;

/**
 * Put complex types with long properties.
 *
 * @param complexBody Please put 1099511627775 and -999511627788
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putLongWithComplexBody:(CLX_LongWrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Get complex types with float properties.
 *
 * @param callback A block where CLX_FloatWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getFloatWithCallback:(void(^)(CLX_FloatWrapper*, AZOperationError*))callback;

/**
 * Put complex types with float properties.
 *
 * @param complexBody Please put 1.05 and -0.003
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putFloatWithComplexBody:(CLX_FloatWrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Get complex types with double properties.
 *
 * @param callback A block where CLX_DoubleWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getDoubleWithCallback:(void(^)(CLX_DoubleWrapper*, AZOperationError*))callback;

/**
 * Put complex types with double properties.
 *
 * @param complexBody Please put 3e-100 and -0.000000000000000000000000000000000000000000000000000000005
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putDoubleWithComplexBody:(CLX_DoubleWrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Get complex types with bool properties.
 *
 * @param callback A block where CLX_BooleanWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getBoolWithCallback:(void(^)(CLX_BooleanWrapper*, AZOperationError*))callback;

/**
 * Put complex types with bool properties.
 *
 * @param complexBody Please put true and false
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putBoolWithComplexBody:(CLX_BooleanWrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Get complex types with string properties.
 *
 * @param callback A block where CLX_StringWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getStringWithCallback:(void(^)(CLX_StringWrapper*, AZOperationError*))callback;

/**
 * Put complex types with string properties.
 *
 * @param complexBody Please put 'goodrequest', '', and null
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putStringWithComplexBody:(CLX_StringWrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Get complex types with date properties.
 *
 * @param callback A block where CLX_DateWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getDateWithCallback:(void(^)(CLX_DateWrapper*, AZOperationError*))callback;

/**
 * Put complex types with date properties.
 *
 * @param complexBody Please put '0001-01-01' and '2016-02-29'
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putDateWithComplexBody:(CLX_DateWrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Get complex types with datetime properties.
 *
 * @param callback A block where CLX_DatetimeWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getDateTimeWithCallback:(void(^)(CLX_DatetimeWrapper*, AZOperationError*))callback;

/**
 * Put complex types with datetime properties.
 *
 * @param complexBody Please put '0001-01-01T12:00:00-04:00' and '2015-05-18T11:38:00-08:00'
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putDateTimeWithComplexBody:(CLX_DatetimeWrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Get complex types with datetimeRfc1123 properties.
 *
 * @param callback A block where CLX_Datetimerfc1123Wrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getDateTimeRfc1123WithCallback:(void(^)(CLX_Datetimerfc1123Wrapper*, AZOperationError*))callback;

/**
 * Put complex types with datetimeRfc1123 properties.
 *
 * @param complexBody Please put 'Mon, 01 Jan 0001 12:00:00 GMT' and 'Mon, 18 May 2015 11:38:00 GMT'
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putDateTimeRfc1123WithComplexBody:(CLX_Datetimerfc1123Wrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Get complex types with duration properties.
 *
 * @param callback A block where CLX_DurationWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getDurationWithCallback:(void(^)(CLX_DurationWrapper*, AZOperationError*))callback;

/**
 * Put complex types with duration properties.
 *
 * @param complexBody Please put 'P123DT22H14M12.011S'
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putDurationWithComplexBody:(CLX_DurationWrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback;

/**
 * Get complex types with byte properties.
 *
 * @param callback A block where CLX_ByteWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getByteWithCallback:(void(^)(CLX_ByteWrapper*, AZOperationError*))callback;

/**
 * Put complex types with byte properties.
 *
 * @param complexBody Please put non-ascii byte string hex(FF FE FD FC 00 FA F9 F8 F7 F6)
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a required parameter is not provided.
 */
- (void)putByteWithComplexBody:(CLX_ByteWrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback;

@end

/**
* The protocol implementation
*/
@class CLX_AutoRestComplexTestServiceService;

@interface CLX_Primitives : NSObject <CLX_PrimitivesProtocol>
@property (readonly) CLX_AutoRestComplexTestServiceService *service;
- (instancetype)initWithService:(CLX_AutoRestComplexTestServiceService *)service;
@end
