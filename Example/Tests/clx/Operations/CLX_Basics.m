/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "CLX_Basics.h"
#import "CLX_Error.h"
#import "CLX_AutoRestComplexTestServiceService.h"

/**
 * The protocol CLX_BasicsProtocol implementation
 */
@implementation CLX_Basics

- (instancetype)initWithService:(CLX_AutoRestComplexTestServiceService *)service {
    if (self = [super init]) {
        _service = service;
    }

    return self;
}

/**
 * Get complex type {id: 2, name: 'abc', color: 'YELLOW'}.
 *
 * @param callback A block where CLX_Basic is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getValidWithCallback:(void(^)(CLX_Basic*, AZOperationError*))callback {

    NSString* __url = [AZRequestHelper buildUrl:self.service.DEFAULT_BASE_URL
                                       withPath:@"/complex/basic/valid"
                                 withPathParams:@{}
                                withQueryParams:@{}];
    AZRequestParameters* __rp = [AZRequestParameters createWithUrl:__url
                                                        withMethod:@"GET"
                                                       withHeaders:@{@"Content-Type":@"application/json; charset=utf-8"}
                                                          withBody:nil];
    [__rp withSpecialHeaders:self.service.specialHeaders];
    [AZRequestHelper executeRequest:__rp
                  withResponseClass:[CLX_Basic class]
                     withErrorClass:[CLX_Error class]
                       withCallback:^(id _Nullable result, AZOperationError* _Nullable error) {
        callback(result, error);
    }];
}

/**
 * Please put {id: 2, name: 'abc', color: 'Magenta'}.
 *
 * @param complexBody Please put {id: 2, name: 'abc', color: 'Magenta'}
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a requred parameter is not provided or a rule validation has failed
 */
- (void)putValidWithComplexBody:(CLX_Basic *)complexBody withCallback:(void(^)(AZOperationError*))callback {

    if (complexBody == nil) {
        @throw [NSException
            exceptionWithName: @"IllegalArgumentException"
            reason: @"Parameter 'complexBody' is required and cannot be nil."
            userInfo: nil];
    }
    NSString* __url = [AZRequestHelper buildUrl:self.service.DEFAULT_BASE_URL
                                       withPath:@"/complex/basic/valid"
                                 withPathParams:@{}
                                withQueryParams:@{@"api-version":self.service.apiVersion}];
    AZRequestParameters* __rp = [AZRequestParameters createWithUrl:__url
                                                        withMethod:@"PUT"
                                                       withHeaders:@{@"Content-Type":@"application/json; charset=utf-8"}
                                                          withBody:[AZJsonCoder encodeObject:complexBody]];
    [__rp withSpecialHeaders:self.service.specialHeaders];
    [AZRequestHelper executeRequest:__rp
                     withErrorClass:[CLX_Error class]
                       withCallback:^(AZOperationError* _Nullable error) {
        callback(error);
    }];
}

/**
 * Get a basic complex type that is invalid for the local strong type.
 *
 * @param callback A block where CLX_Basic is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getInvalidWithCallback:(void(^)(CLX_Basic*, AZOperationError*))callback {

    NSString* __url = [AZRequestHelper buildUrl:self.service.DEFAULT_BASE_URL
                                       withPath:@"/complex/basic/invalid"
                                 withPathParams:@{}
                                withQueryParams:@{}];
    AZRequestParameters* __rp = [AZRequestParameters createWithUrl:__url
                                                        withMethod:@"GET"
                                                       withHeaders:@{@"Content-Type":@"application/json; charset=utf-8"}
                                                          withBody:nil];
    [__rp withSpecialHeaders:self.service.specialHeaders];
    [AZRequestHelper executeRequest:__rp
                  withResponseClass:[CLX_Basic class]
                     withErrorClass:[CLX_Error class]
                       withCallback:^(id _Nullable result, AZOperationError* _Nullable error) {
        callback(result, error);
    }];
}

/**
 * Get a basic complex type that is empty.
 *
 * @param callback A block where CLX_Basic is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getEmptyWithCallback:(void(^)(CLX_Basic*, AZOperationError*))callback {

    NSString* __url = [AZRequestHelper buildUrl:self.service.DEFAULT_BASE_URL
                                       withPath:@"/complex/basic/empty"
                                 withPathParams:@{}
                                withQueryParams:@{}];
    AZRequestParameters* __rp = [AZRequestParameters createWithUrl:__url
                                                        withMethod:@"GET"
                                                       withHeaders:@{@"Content-Type":@"application/json; charset=utf-8"}
                                                          withBody:nil];
    [__rp withSpecialHeaders:self.service.specialHeaders];
    [AZRequestHelper executeRequest:__rp
                  withResponseClass:[CLX_Basic class]
                     withErrorClass:[CLX_Error class]
                       withCallback:^(id _Nullable result, AZOperationError* _Nullable error) {
        callback(result, error);
    }];
}

/**
 * Get a basic complex type whose properties are null.
 *
 * @param callback A block where CLX_Basic is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getNullWithCallback:(void(^)(CLX_Basic*, AZOperationError*))callback {

    NSString* __url = [AZRequestHelper buildUrl:self.service.DEFAULT_BASE_URL
                                       withPath:@"/complex/basic/null"
                                 withPathParams:@{}
                                withQueryParams:@{}];
    AZRequestParameters* __rp = [AZRequestParameters createWithUrl:__url
                                                        withMethod:@"GET"
                                                       withHeaders:@{@"Content-Type":@"application/json; charset=utf-8"}
                                                          withBody:nil];
    [__rp withSpecialHeaders:self.service.specialHeaders];
    [AZRequestHelper executeRequest:__rp
                  withResponseClass:[CLX_Basic class]
                     withErrorClass:[CLX_Error class]
                       withCallback:^(id _Nullable result, AZOperationError* _Nullable error) {
        callback(result, error);
    }];
}

/**
 * Get a basic complex type while the server doesn't provide a response payload.
 *
 * @param callback A block where CLX_Basic is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getNotProvidedWithCallback:(void(^)(CLX_Basic*, AZOperationError*))callback {

    NSString* __url = [AZRequestHelper buildUrl:self.service.DEFAULT_BASE_URL
                                       withPath:@"/complex/basic/notprovided"
                                 withPathParams:@{}
                                withQueryParams:@{}];
    AZRequestParameters* __rp = [AZRequestParameters createWithUrl:__url
                                                        withMethod:@"GET"
                                                       withHeaders:@{@"Content-Type":@"application/json; charset=utf-8"}
                                                          withBody:nil];
    [__rp withSpecialHeaders:self.service.specialHeaders];
    [AZRequestHelper executeRequest:__rp
                  withResponseClass:[CLX_Basic class]
                     withErrorClass:[CLX_Error class]
                       withCallback:^(id _Nullable result, AZOperationError* _Nullable error) {
        callback(result, error);
    }];
}

@end
