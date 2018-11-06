/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import <XCTest/XCTest.h>
#include <AzureClientRuntime/AzureClientRuntime.h>
#import "FL_AutoRestSwaggerBATFileServiceService.h"
@interface FL_AutoRestSwaggerBATFileServiceServiceTests : XCTestCase
    @property id<FL_AutoRestSwaggerBATFileServiceServiceProtocol> service;
@end
@implementation FL_AutoRestSwaggerBATFileServiceServiceTests
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.continueAfterFailure = NO;
    self.service = [FL_AutoRestSwaggerBATFileServiceService create];
}
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

//>>>> FL_Files files


/**
 * Get file.
 *
 */
- (void) test_files_getFile {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<FL_FilesProtocol> op = [self.service files];
    [op getFileWithCallback:^(AZStream* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get a large file.
 *
 */
- (void) test_files_getFileLarge {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<FL_FilesProtocol> op = [self.service files];
    [op getFileLargeWithCallback:^(AZStream* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get empty file.
 *
 */
- (void) test_files_getEmptyFile {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<FL_FilesProtocol> op = [self.service files];
    [op getEmptyFileWithCallback:^(AZStream* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}



//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}
@end