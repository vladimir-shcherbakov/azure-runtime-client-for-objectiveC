/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "Readonlypropertys.h"
#import "Error.h"
#import "../AutoRestComplexTestService.h"

/**
 * The protocol ReadonlypropertysProtocol implementation
 */
@implementation Readonlypropertys

    - (instancetype) initWithService: (AutoRestComplexTestService *) service {
        if (self = [super init]) {
            _service = service;
        }

        return self;
    }

    /**
     * Get complex types that have readonly properties.
    *
     * @param callback A block where ReadonlyObj is a result object and OperationError is nil, if the operation is successful
     */
    - (void) getValidWithCallback : (void(^)(ReadonlyObj*, OperationError*)) callback {


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/readonlyproperty/valid"
                                   withPathParams: @{}
                                  withQueryParams: @{}];

        RequestParameters* __rp = [RequestParameters createWithUrl: __url
                                                        withMethod: @"GET"
                                                       withHeaders: @{@"Content-Type" : @"application/json; charset=utf-8"}
                                                          withBody: nil];

        [RequestHelper executeRequest:__rp
                    withResponseClass:[ReadonlyObj class]
                       withErrorClass:[Error class]
                         withCallback:^(id _Nullable result, OperationError* _Nullable error) {
            callback(result, error);
        }];

    }


    /**
     * Put complex types that have readonly properties.
    *
     * @param complexBody the ReadonlyObj value
     * @param callback A block where OperationError is nil if the operation is successful
     * @throws IllegalArgumentException if a requred parameter is not provided.
     */
    - (void) putValidWithComplexBody : (ReadonlyObj *) complexBody withCallback : (void(^)(OperationError*)) callback {

        if (complexBody == nil) {
            NSException *e = [NSException
                exceptionWithName: @"IllegalArgumentException"
                reason: @"Parameter complexBody is required and cannot be nil."
                userInfo: nil];
            @throw e;
        }


        NSString* __url = [RequestHelper buildUrl: self.service.DEFAULT_BASE_URL
                                         withPath: @"/complex/readonlyproperty/valid"
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
