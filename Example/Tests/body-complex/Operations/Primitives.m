/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "Primitives.h"
#import "Error.h"
#import "../AutoRestComplexTestService.h"

/**
 * The protocol PrimitivesProtocol implementation
 */
@implementation Primitives

    - (instancetype) initWithService: (AutoRestComplexTestService *) service {
        if (self = [super init]) {
            _service = service;
        }

        return self;
    }

    /**
     * Get complex types with integer properties.
    *
     * @param callback A block where IntWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getIntWithCallback : (void(^)(IntWrapper*, OperationError*)) callback {


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/integer"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"GET"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: nil];

        [RequestHelper executeRequest:__rp
                    withResponseClass:[IntWrapper class]
                       withErrorClass:[Error class]
                         withCallback:^(id _Nullable result, OperationError* _Nullable error) {
            callback(result, error);
        }];

    }


    /**
     * Put complex types with integer properties.
    *
     * @param complexBody Please put -1 and 2
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a requred parameter is not provided.
     */
    - (void) putIntWithComplexBody : (IntWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback {

        if (complexBody == nil) {
            NSException *e = [NSException
                exceptionWithName: @"IllegalArgumentException"
                reason: @"Parameter complexBody is required and cannot be nil."
                userInfo: nil];
            @throw e;
        }


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/integer"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"PUT"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: [JsonCoder encodeObject:complexBody]];

         [RequestHelper executeRequest:__rp
                        withErrorClass:[Error class]
                          withCallback:^(OperationError* _Nullable error) {
            callback(error);
        }];

    }


    /**
     * Get complex types with long properties.
    *
     * @param callback A block where LongWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getLongWithCallback : (void(^)(LongWrapper*, OperationError*)) callback {


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/long"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"GET"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: nil];

        [RequestHelper executeRequest:__rp
                    withResponseClass:[LongWrapper class]
                       withErrorClass:[Error class]
                         withCallback:^(id _Nullable result, OperationError* _Nullable error) {
            callback(result, error);
        }];

    }


    /**
     * Put complex types with long properties.
    *
     * @param complexBody Please put 1099511627775 and -999511627788
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a requred parameter is not provided.
     */
    - (void) putLongWithComplexBody : (LongWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback {

        if (complexBody == nil) {
            NSException *e = [NSException
                exceptionWithName: @"IllegalArgumentException"
                reason: @"Parameter complexBody is required and cannot be nil."
                userInfo: nil];
            @throw e;
        }


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/long"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"PUT"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: [JsonCoder encodeObject:complexBody]];

         [RequestHelper executeRequest:__rp
                        withErrorClass:[Error class]
                          withCallback:^(OperationError* _Nullable error) {
            callback(error);
        }];

    }


    /**
     * Get complex types with float properties.
    *
     * @param callback A block where FloatWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getFloatWithCallback : (void(^)(FloatWrapper*, OperationError*)) callback {


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/float"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"GET"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: nil];

        [RequestHelper executeRequest:__rp
                    withResponseClass:[FloatWrapper class]
                       withErrorClass:[Error class]
                         withCallback:^(id _Nullable result, OperationError* _Nullable error) {
            callback(result, error);
        }];

    }


    /**
     * Put complex types with float properties.
    *
     * @param complexBody Please put 1.05 and -0.003
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a requred parameter is not provided.
     */
    - (void) putFloatWithComplexBody : (FloatWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback {

        if (complexBody == nil) {
            NSException *e = [NSException
                exceptionWithName: @"IllegalArgumentException"
                reason: @"Parameter complexBody is required and cannot be nil."
                userInfo: nil];
            @throw e;
        }


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/float"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"PUT"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: [JsonCoder encodeObject:complexBody]];

         [RequestHelper executeRequest:__rp
                        withErrorClass:[Error class]
                          withCallback:^(OperationError* _Nullable error) {
            callback(error);
        }];

    }


    /**
     * Get complex types with double properties.
    *
     * @param callback A block where DoubleWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getDoubleWithCallback : (void(^)(DoubleWrapper*, OperationError*)) callback {


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/double"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"GET"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: nil];

        [RequestHelper executeRequest:__rp
                    withResponseClass:[DoubleWrapper class]
                       withErrorClass:[Error class]
                         withCallback:^(id _Nullable result, OperationError* _Nullable error) {
            callback(result, error);
        }];

    }


    /**
     * Put complex types with double properties.
    *
     * @param complexBody Please put 3e-100 and -0.000000000000000000000000000000000000000000000000000000005
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a requred parameter is not provided.
     */
    - (void) putDoubleWithComplexBody : (DoubleWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback {

        if (complexBody == nil) {
            NSException *e = [NSException
                exceptionWithName: @"IllegalArgumentException"
                reason: @"Parameter complexBody is required and cannot be nil."
                userInfo: nil];
            @throw e;
        }


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/double"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"PUT"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: [JsonCoder encodeObject:complexBody]];

         [RequestHelper executeRequest:__rp
                        withErrorClass:[Error class]
                          withCallback:^(OperationError* _Nullable error) {
            callback(error);
        }];

    }


    /**
     * Get complex types with bool properties.
    *
     * @param callback A block where BooleanWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getBoolWithCallback : (void(^)(BooleanWrapper*, OperationError*)) callback {


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/bool"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"GET"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: nil];

        [RequestHelper executeRequest:__rp
                    withResponseClass:[BooleanWrapper class]
                       withErrorClass:[Error class]
                         withCallback:^(id _Nullable result, OperationError* _Nullable error) {
            callback(result, error);
        }];

    }


    /**
     * Put complex types with bool properties.
    *
     * @param complexBody Please put true and false
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a requred parameter is not provided.
     */
    - (void) putBoolWithComplexBody : (BooleanWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback {

        if (complexBody == nil) {
            NSException *e = [NSException
                exceptionWithName: @"IllegalArgumentException"
                reason: @"Parameter complexBody is required and cannot be nil."
                userInfo: nil];
            @throw e;
        }


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/bool"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"PUT"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: [JsonCoder encodeObject:complexBody]];

         [RequestHelper executeRequest:__rp
                        withErrorClass:[Error class]
                          withCallback:^(OperationError* _Nullable error) {
            callback(error);
        }];

    }


    /**
     * Get complex types with string properties.
    *
     * @param callback A block where StringWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getStringWithCallback : (void(^)(StringWrapper*, OperationError*)) callback {


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/string"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"GET"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: nil];

        [RequestHelper executeRequest:__rp
                    withResponseClass:[StringWrapper class]
                       withErrorClass:[Error class]
                         withCallback:^(id _Nullable result, OperationError* _Nullable error) {
            callback(result, error);
        }];

    }


    /**
     * Put complex types with string properties.
    *
     * @param complexBody Please put 'goodrequest', '', and null
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a requred parameter is not provided.
     */
    - (void) putStringWithComplexBody : (StringWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback {

        if (complexBody == nil) {
            NSException *e = [NSException
                exceptionWithName: @"IllegalArgumentException"
                reason: @"Parameter complexBody is required and cannot be nil."
                userInfo: nil];
            @throw e;
        }


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/string"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"PUT"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: [JsonCoder encodeObject:complexBody]];

         [RequestHelper executeRequest:__rp
                        withErrorClass:[Error class]
                          withCallback:^(OperationError* _Nullable error) {
            callback(error);
        }];

    }


    /**
     * Get complex types with date properties.
    *
     * @param callback A block where DateWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getDateWithCallback : (void(^)(DateWrapper*, OperationError*)) callback {


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/date"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"GET"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: nil];

        [RequestHelper executeRequest:__rp
                    withResponseClass:[DateWrapper class]
                       withErrorClass:[Error class]
                         withCallback:^(id _Nullable result, OperationError* _Nullable error) {
            callback(result, error);
        }];

    }


    /**
     * Put complex types with date properties.
    *
     * @param complexBody Please put '0001-01-01' and '2016-02-29'
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a requred parameter is not provided.
     */
    - (void) putDateWithComplexBody : (DateWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback {

        if (complexBody == nil) {
            NSException *e = [NSException
                exceptionWithName: @"IllegalArgumentException"
                reason: @"Parameter complexBody is required and cannot be nil."
                userInfo: nil];
            @throw e;
        }


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/date"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"PUT"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: [JsonCoder encodeObject:complexBody]];

         [RequestHelper executeRequest:__rp
                        withErrorClass:[Error class]
                          withCallback:^(OperationError* _Nullable error) {
            callback(error);
        }];

    }


    /**
     * Get complex types with datetime properties.
    *
     * @param callback A block where DatetimeWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getDateTimeWithCallback : (void(^)(DatetimeWrapper*, OperationError*)) callback {


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/datetime"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"GET"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: nil];

        [RequestHelper executeRequest:__rp
                    withResponseClass:[DatetimeWrapper class]
                       withErrorClass:[Error class]
                         withCallback:^(id _Nullable result, OperationError* _Nullable error) {
            callback(result, error);
        }];

    }


    /**
     * Put complex types with datetime properties.
    *
     * @param complexBody Please put '0001-01-01T12:00:00-04:00' and '2015-05-18T11:38:00-08:00'
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a requred parameter is not provided.
     */
    - (void) putDateTimeWithComplexBody : (DatetimeWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback {

        if (complexBody == nil) {
            NSException *e = [NSException
                exceptionWithName: @"IllegalArgumentException"
                reason: @"Parameter complexBody is required and cannot be nil."
                userInfo: nil];
            @throw e;
        }


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/datetime"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"PUT"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: [JsonCoder encodeObject:complexBody]];

         [RequestHelper executeRequest:__rp
                        withErrorClass:[Error class]
                          withCallback:^(OperationError* _Nullable error) {
            callback(error);
        }];

    }


    /**
     * Get complex types with datetimeRfc1123 properties.
    *
     * @param callback A block where Datetimerfc1123Wrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getDateTimeRfc1123WithCallback : (void(^)(Datetimerfc1123Wrapper*, OperationError*)) callback {


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/datetimerfc1123"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"GET"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: nil];

        [RequestHelper executeRequest:__rp
                    withResponseClass:[Datetimerfc1123Wrapper class]
                       withErrorClass:[Error class]
                         withCallback:^(id _Nullable result, OperationError* _Nullable error) {
            callback(result, error);
        }];

    }


    /**
     * Put complex types with datetimeRfc1123 properties.
    *
     * @param complexBody Please put 'Mon, 01 Jan 0001 12:00:00 GMT' and 'Mon, 18 May 2015 11:38:00 GMT'
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a requred parameter is not provided.
     */
    - (void) putDateTimeRfc1123WithComplexBody : (Datetimerfc1123Wrapper *) complexBody withCallback : (void(^)(OperationError*)) callback {

        if (complexBody == nil) {
            NSException *e = [NSException
                exceptionWithName: @"IllegalArgumentException"
                reason: @"Parameter complexBody is required and cannot be nil."
                userInfo: nil];
            @throw e;
        }


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/datetimerfc1123"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"PUT"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: [JsonCoder encodeObject:complexBody]];

         [RequestHelper executeRequest:__rp
                        withErrorClass:[Error class]
                          withCallback:^(OperationError* _Nullable error) {
            callback(error);
        }];

    }


    /**
     * Get complex types with duration properties.
    *
     * @param callback A block where DurationWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getDurationWithCallback : (void(^)(DurationWrapper*, OperationError*)) callback {


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/duration"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"GET"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: nil];

        [RequestHelper executeRequest:__rp
                    withResponseClass:[DurationWrapper class]
                       withErrorClass:[Error class]
                         withCallback:^(id _Nullable result, OperationError* _Nullable error) {
            callback(result, error);
        }];

    }


    /**
     * Put complex types with duration properties.
    *
     * @param complexBody Please put 'P123DT22H14M12.011S'
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a requred parameter is not provided.
     */
    - (void) putDurationWithComplexBody : (DurationWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback {

        if (complexBody == nil) {
            NSException *e = [NSException
                exceptionWithName: @"IllegalArgumentException"
                reason: @"Parameter complexBody is required and cannot be nil."
                userInfo: nil];
            @throw e;
        }


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/duration"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"PUT"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: [JsonCoder encodeObject:complexBody]];

         [RequestHelper executeRequest:__rp
                        withErrorClass:[Error class]
                          withCallback:^(OperationError* _Nullable error) {
            callback(error);
        }];

    }


    /**
     * Get complex types with byte properties.
    *
     * @param callback A block where ByteWrapper is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getByteWithCallback : (void(^)(ByteWrapper*, OperationError*)) callback {


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/byte"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"GET"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: nil];

        [RequestHelper executeRequest:__rp
                    withResponseClass:[ByteWrapper class]
                       withErrorClass:[Error class]
                         withCallback:^(id _Nullable result, OperationError* _Nullable error) {
            callback(result, error);
        }];

    }


    /**
     * Put complex types with byte properties.
    *
     * @param complexBody Please put non-ascii byte string hex(FF FE FD FC 00 FA F9 F8 F7 F6)
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a requred parameter is not provided.
     */
    - (void) putByteWithComplexBody : (ByteWrapper *) complexBody withCallback : (void(^)(OperationError*)) callback {

        if (complexBody == nil) {
            NSException *e = [NSException
                exceptionWithName: @"IllegalArgumentException"
                reason: @"Parameter complexBody is required and cannot be nil."
                userInfo: nil];
            @throw e;
        }


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/primitive/byte"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"PUT"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: [JsonCoder encodeObject:complexBody]];

         [RequestHelper executeRequest:__rp
                        withErrorClass:[Error class]
                          withCallback:^(OperationError* _Nullable error) {
            callback(error);
        }];

    }


@end
