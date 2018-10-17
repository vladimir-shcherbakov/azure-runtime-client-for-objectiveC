/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "../Models/BooleanWrapper.h"
#import "../Models/ByteWrapper.h"
#import "../Models/Datetimerfc1123Wrapper.h"
#import "../Models/DatetimeWrapper.h"
#import "../Models/DateWrapper.h"
#import "../Models/DoubleWrapper.h"
#import "../Models/DurationWrapper.h"
#import "../Models/FloatWrapper.h"
#import "../Models/IntWrapper.h"
#import "../Models/LongWrapper.h"
#import "../Models/StringWrapper.h"
@class OperationError;

/**
 * An protocol provides access to all Primitives operations
 */
@protocol PrimitivesProtocol

    /**
     * Get complex types with integer properties.
     *
     * @param callback A block where IntWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getIntWithCallback : (void(^)(IntWrapper*, OperationError*)) callback;

    /**
     * Put complex types with integer properties.
     *
     * @param complexBody Please put -1 and 2
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a required parameter is not provided.
     */
    - (void) putIntWithComplexBody : (IntWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback;

    /**
     * Get complex types with long properties.
     *
     * @param callback A block where LongWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getLongWithCallback : (void(^)(LongWrapper*, OperationError*)) callback;

    /**
     * Put complex types with long properties.
     *
     * @param complexBody Please put 1099511627775 and -999511627788
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a required parameter is not provided.
     */
    - (void) putLongWithComplexBody : (LongWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback;

    /**
     * Get complex types with float properties.
     *
     * @param callback A block where FloatWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getFloatWithCallback : (void(^)(FloatWrapper*, OperationError*)) callback;

    /**
     * Put complex types with float properties.
     *
     * @param complexBody Please put 1.05 and -0.003
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a required parameter is not provided.
     */
    - (void) putFloatWithComplexBody : (FloatWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback;

    /**
     * Get complex types with double properties.
     *
     * @param callback A block where DoubleWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getDoubleWithCallback : (void(^)(DoubleWrapper*, OperationError*)) callback;

    /**
     * Put complex types with double properties.
     *
     * @param complexBody Please put 3e-100 and -0.000000000000000000000000000000000000000000000000000000005
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a required parameter is not provided.
     */
    - (void) putDoubleWithComplexBody : (DoubleWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback;

    /**
     * Get complex types with bool properties.
     *
     * @param callback A block where BooleanWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getBoolWithCallback : (void(^)(BooleanWrapper*, OperationError*)) callback;

    /**
     * Put complex types with bool properties.
     *
     * @param complexBody Please put true and false
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a required parameter is not provided.
     */
    - (void) putBoolWithComplexBody : (BooleanWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback;

    /**
     * Get complex types with string properties.
     *
     * @param callback A block where StringWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getStringWithCallback : (void(^)(StringWrapper*, OperationError*)) callback;

    /**
     * Put complex types with string properties.
     *
     * @param complexBody Please put 'goodrequest', '', and null
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a required parameter is not provided.
     */
    - (void) putStringWithComplexBody : (StringWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback;

    /**
     * Get complex types with date properties.
     *
     * @param callback A block where DateWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getDateWithCallback : (void(^)(DateWrapper*, OperationError*)) callback;

    /**
     * Put complex types with date properties.
     *
     * @param complexBody Please put '0001-01-01' and '2016-02-29'
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a required parameter is not provided.
     */
    - (void) putDateWithComplexBody : (DateWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback;

    /**
     * Get complex types with datetime properties.
     *
     * @param callback A block where DatetimeWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getDateTimeWithCallback : (void(^)(DatetimeWrapper*, OperationError*)) callback;

    /**
     * Put complex types with datetime properties.
     *
     * @param complexBody Please put '0001-01-01T12:00:00-04:00' and '2015-05-18T11:38:00-08:00'
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a required parameter is not provided.
     */
    - (void) putDateTimeWithComplexBody : (DatetimeWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback;

    /**
     * Get complex types with datetimeRfc1123 properties.
     *
     * @param callback A block where Datetimerfc1123Wrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getDateTimeRfc1123WithCallback : (void(^)(Datetimerfc1123Wrapper*, OperationError*)) callback;

    /**
     * Put complex types with datetimeRfc1123 properties.
     *
     * @param complexBody Please put 'Mon, 01 Jan 0001 12:00:00 GMT' and 'Mon, 18 May 2015 11:38:00 GMT'
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a required parameter is not provided.
     */
    - (void) putDateTimeRfc1123WithComplexBody : (Datetimerfc1123Wrapper *) complexBody withCallback : (void(^)(OperationError*)) callback;

    /**
     * Get complex types with duration properties.
     *
     * @param callback A block where DurationWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getDurationWithCallback : (void(^)(DurationWrapper*, OperationError*)) callback;

    /**
     * Put complex types with duration properties.
     *
     * @param complexBody Please put 'P123DT22H14M12.011S'
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a required parameter is not provided.
     */
    - (void) putDurationWithComplexBody : (DurationWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback;

    /**
     * Get complex types with byte properties.
     *
     * @param callback A block where ByteWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getByteWithCallback : (void(^)(ByteWrapper*, OperationError*)) callback;

    /**
     * Put complex types with byte properties.
     *
     * @param complexBody Please put non-ascii byte string hex(FF FE FD FC 00 FA F9 F8 F7 F6)
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a required parameter is not provided.
     */
    - (void) putByteWithComplexBody : (ByteWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback;

@end

/**
* The protocol implementation
*/
@class AutoRestComplexTestService;

@interface Primitives : NSObject <PrimitivesProtocol>
@property (readonly) AutoRestComplexTestService* service;
- (instancetype) initWithService: (AutoRestComplexTestService *) service;
@end