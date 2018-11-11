//
//  RuntimeClientTests.m
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/2/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AzureClientRuntime/AzureClientRuntime.h>
#import "Note.h"
#import "ComplexModel.h"
#import "SimpleModel.h"
#import "AzTestError.h"

@interface RequestHelperTests : XCTestCase

@end

@implementation RequestHelperTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void) testBuildUrl {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSString *baseUrl = @"https://{accountName}.blob.core.windows.net";
    NSString *path = @"/{container}/{blob}";
    NSDictionary *pathParams = @{@"{accountName}":@"first",
                                   @"{container}":@"second",
                                        @"{blob}":@"third"};
    NSString *val1 = nil;
    NSString *val2 = @"second";
    NSDictionary* queryParams = @{@"snapshot":@"first",
                                      @"key1":AZ_NULLABLE(val1),
                                      @"key2":AZ_NULLABLE(val2)};
    
    NSString *url = [AZRequestHelper buildUrl:baseUrl
                                     withPath:path
                               withPathParams:pathParams
                              withQueryParams:queryParams];
    
    XCTAssertEqualObjects(@"https://first.blob.core.windows.net/second/third?snapshot=first&key2=second", url);
}

- (void) testRequestParametersSpecialHeaders {
    AZRequestParameters* rp = [AZRequestParameters createWithUrl:@"https://windows.net"
                                                      withMethod:@"POST"
                                                     withHeaders:@{@"Content-Type":@"application/octet-stream"}
                                                        withBody:nil];
    [rp withSpecialHeaders:@{@"sk1":@"sv1", @"sk2":@"sv2"}];
}
- (void) testErrorAsJson {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    NSString *body = @"{\"url\": \"https://testpictures.blob.core.windows.net/cogsrv/analyze1.jpg\"}";
    
    AZRequestParameters* rp = [AZRequestParameters createWithUrl:@"https://westus2.api.cognitive.microsoft.com/face/v1.0/detect?returnFaceLandmarks=false&returnFaceId=true&returnFaceAttributes=age,gender,emotion"
                                                      withMethod:@"POST"
                                                     withHeaders:@{@"Content-Type":@"application/json; charset=utf-8",@"Ocp-Apim-Subscription-Key":@"123"}
                                                        withBody:[AZJsonCoder encodeObject:body]];
    [AZRequestHelper executeRequest:rp
                     withErrorClass:[AZTestError class]
                       withCallback:^(AZOperationError* _Nullable error) {
                           [waitingLoading fulfill];
                           XCTAssertNotNil(error, @"%@", error.reason);
                       }];
   
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}
@end
