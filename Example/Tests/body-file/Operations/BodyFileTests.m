//
//  BodyFileTests.m
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/13/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AzureClientRuntime/AzureClientRuntime.h>
#import "AutoRestSwaggerBATFileService.h"

@interface BodyFileTests : XCTestCase

    @property id<AutoRestSwaggerBATFileServiceProtocol> service;

@end

@implementation BodyFileTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    self.service = [AutoRestSwaggerBATFileService create];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)test_Files_GetFile {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<FilesProtocol> op =[self.service files];
    
    [op getFileWithCallback:^(AZStream * file, OperationError *error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(file);
        XCTAssertTrue(file.length==8725);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Files_GetFileLarge {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<FilesProtocol> op =[self.service files];
    
    [op getFileLargeWithCallback:^(AZStream * file, OperationError *error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(file);
        XCTAssertTrue(file.length==3145728000);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}


@end
