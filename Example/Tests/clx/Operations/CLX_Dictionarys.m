/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "CLX_Dictionarys.h"
#import "CLX_Error.h"
#import "CLX_AutoRestComplexTestServiceService.h"

/**
 * The protocol CLX_DictionarysProtocol implementation
 */
@implementation CLX_Dictionarys

- (instancetype)initWithService:(CLX_AutoRestComplexTestServiceService *)service {
    if (self = [super init]) {
        _service = service;
    }

    return self;
}

/**
 * Get complex types with dictionary property.
 *
 * @param callback A block where CLX_DictionaryWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getValidWithCallback:(void(^)(CLX_DictionaryWrapper*, AZOperationError*))callback {

    NSString* __url = [AZRequestHelper buildUrl:self.service.DEFAULT_BASE_URL
                                       withPath:@"/complex/dictionary/typed/valid"
                                 withPathParams:@{}
                                withQueryParams:@{}];
    AZRequestParameters* __rp = [AZRequestParameters createWithUrl:__url
                                                        withMethod:@"GET"
                                                       withHeaders:@{@"Content-Type":@"application/json; charset=utf-8"}
                                                          withBody:nil];
    [__rp withSpecialHeaders:self.service.specialHeaders];
    [AZRequestHelper executeRequest:__rp
                  withResponseClass:[CLX_DictionaryWrapper class]
                     withErrorClass:[CLX_Error class]
                       withCallback:^(id _Nullable result, AZOperationError* _Nullable error) {
        callback(result, error);
    }];
}

/**
 * Put complex types with dictionary property.
 *
 * @param complexBody Please put a dictionary with 5 key-value pairs: "txt":"notepad", "bmp":"mspaint", "xls":"excel", "exe":"", "":null
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a requred parameter is not provided or a rule validation has failed
 */
- (void)putValidWithComplexBody:(CLX_DictionaryWrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback {

    if (complexBody == nil) {
        @throw [NSException
            exceptionWithName: @"IllegalArgumentException"
            reason: @"Parameter 'complexBody' is required and cannot be nil."
            userInfo: nil];
    }
    NSString* __url = [AZRequestHelper buildUrl:self.service.DEFAULT_BASE_URL
                                       withPath:@"/complex/dictionary/typed/valid"
                                 withPathParams:@{}
                                withQueryParams:@{}];
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
 * Get complex types with dictionary property which is empty.
 *
 * @param callback A block where CLX_DictionaryWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getEmptyWithCallback:(void(^)(CLX_DictionaryWrapper*, AZOperationError*))callback {

    NSString* __url = [AZRequestHelper buildUrl:self.service.DEFAULT_BASE_URL
                                       withPath:@"/complex/dictionary/typed/empty"
                                 withPathParams:@{}
                                withQueryParams:@{}];
    AZRequestParameters* __rp = [AZRequestParameters createWithUrl:__url
                                                        withMethod:@"GET"
                                                       withHeaders:@{@"Content-Type":@"application/json; charset=utf-8"}
                                                          withBody:nil];
    [__rp withSpecialHeaders:self.service.specialHeaders];
    [AZRequestHelper executeRequest:__rp
                  withResponseClass:[CLX_DictionaryWrapper class]
                     withErrorClass:[CLX_Error class]
                       withCallback:^(id _Nullable result, AZOperationError* _Nullable error) {
        callback(result, error);
    }];
}

/**
 * Put complex types with dictionary property which is empty.
 *
 * @param complexBody Please put an empty dictionary
 * @param callback A block where AZOperationError is nil if the operation is successful
 * @throws IllegalArgumentException if a requred parameter is not provided or a rule validation has failed
 */
- (void)putEmptyWithComplexBody:(CLX_DictionaryWrapper *)complexBody withCallback:(void(^)(AZOperationError*))callback {

    if (complexBody == nil) {
        @throw [NSException
            exceptionWithName: @"IllegalArgumentException"
            reason: @"Parameter 'complexBody' is required and cannot be nil."
            userInfo: nil];
    }
    NSString* __url = [AZRequestHelper buildUrl:self.service.DEFAULT_BASE_URL
                                       withPath:@"/complex/dictionary/typed/empty"
                                 withPathParams:@{}
                                withQueryParams:@{}];
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
 * Get complex types with dictionary property which is null.
 *
 * @param callback A block where CLX_DictionaryWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getNullWithCallback:(void(^)(CLX_DictionaryWrapper*, AZOperationError*))callback {

    NSString* __url = [AZRequestHelper buildUrl:self.service.DEFAULT_BASE_URL
                                       withPath:@"/complex/dictionary/typed/null"
                                 withPathParams:@{}
                                withQueryParams:@{}];
    AZRequestParameters* __rp = [AZRequestParameters createWithUrl:__url
                                                        withMethod:@"GET"
                                                       withHeaders:@{@"Content-Type":@"application/json; charset=utf-8"}
                                                          withBody:nil];
    [__rp withSpecialHeaders:self.service.specialHeaders];
    [AZRequestHelper executeRequest:__rp
                  withResponseClass:[CLX_DictionaryWrapper class]
                     withErrorClass:[CLX_Error class]
                       withCallback:^(id _Nullable result, AZOperationError* _Nullable error) {
        callback(result, error);
    }];
}

/**
 * Get complex types with dictionary property while server doesn't provide a response payload.
 *
 * @param callback A block where CLX_DictionaryWrapper is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getNotProvidedWithCallback:(void(^)(CLX_DictionaryWrapper*, AZOperationError*))callback {

    NSString* __url = [AZRequestHelper buildUrl:self.service.DEFAULT_BASE_URL
                                       withPath:@"/complex/dictionary/typed/notprovided"
                                 withPathParams:@{}
                                withQueryParams:@{}];
    AZRequestParameters* __rp = [AZRequestParameters createWithUrl:__url
                                                        withMethod:@"GET"
                                                       withHeaders:@{@"Content-Type":@"application/json; charset=utf-8"}
                                                          withBody:nil];
    [__rp withSpecialHeaders:self.service.specialHeaders];
    [AZRequestHelper executeRequest:__rp
                  withResponseClass:[CLX_DictionaryWrapper class]
                     withErrorClass:[CLX_Error class]
                       withCallback:^(id _Nullable result, AZOperationError* _Nullable error) {
        callback(result, error);
    }];
}

@end
