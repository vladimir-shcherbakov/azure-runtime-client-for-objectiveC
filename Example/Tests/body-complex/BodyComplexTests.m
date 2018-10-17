//
//  BodyComplexTests.m
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/7/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AutoRestComplexTestService.h"
#import <AzureClientRuntime/AzureClientRuntime.h>

@interface BodyComplexTests : XCTestCase

@property id<AutoRestComplexTestServiceProtocol> service;

@end

@implementation BodyComplexTests

- (void)setUp {
    self.continueAfterFailure = NO;
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.service = [AutoRestComplexTestService createWithApiVersion:@"2016-02-29"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)test_Basic_getValid {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<BasicsProtocol> op =[self.service basics];
    
    [op getValidWithCallback:^(Basic * basic, OperationError *error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Basic_putValid {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<BasicsProtocol> op =[self.service basics];
    
    Basic* basic = [Basic new];
    basic.color = CMYKColors.MAGENTA;
    basic.name = @"abc";
    basic.idProperty = @2;
    
    [op putValidWithComplexBody:basic withCallback:^(OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Basic_getInvalid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<BasicsProtocol> op =[self.service basics];
    
    [op getInvalidWithCallback:^(Basic * basic, OperationError *error) {
        
        [waitingLoading fulfill];
        XCTAssertNotNil(error, @"%@", error.reason);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Basic_getEmpty {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<BasicsProtocol> op =[self.service basics];
    
    [op getEmptyWithCallback:^(Basic * basic, OperationError *error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Basic_getNull {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<BasicsProtocol> op =[self.service basics];
    
    [op getNullWithCallback:^(Basic * basic, OperationError *error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Basic_getNotProvided {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<BasicsProtocol> op =[self.service basics];
    
    [op getNotProvidedWithCallback:^(Basic * basic, OperationError *error) {
        
        [waitingLoading fulfill];
        XCTAssertNotNil(error, @"%@", error.reason);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_getInt {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    [op getIntWithCallback:^(IntWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        XCTAssertEqualObjects(@-1, result.field1);
        XCTAssertEqualObjects(@2, result.field2);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_putInt {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    IntWrapper* input = [IntWrapper new];
    input.field1 = @-1;
    input.field2 = @2;
    
    [op putIntWithComplexBody:(IntWrapper *) input withCallback:^(OperationError * error) {
     
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_getLong {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    [op getLongWithCallback:^(LongWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        XCTAssertEqualObjects(@1099511627775, result.field1);
        XCTAssertEqualObjects(@-999511627788, result.field2);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_putLong {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    LongWrapper* input = [LongWrapper new];
    input.field1 = @1099511627775;
    input.field2 = @-999511627788;
    
    [op putLongWithComplexBody:(LongWrapper *) input withCallback:^(OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_getFloat {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    [op getFloatWithCallback:^(FloatWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        XCTAssertEqualObjects(@1.05, result.field1);
        XCTAssertEqualObjects(@-0.003, result.field2);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_putFloat {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    FloatWrapper* input = [FloatWrapper new];
    input.field1 = @1.05;
    input.field2 = @-0.003;
    
    [op putFloatWithComplexBody:(FloatWrapper *) input withCallback:^(OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_getDouble {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    [op getDoubleWithCallback:^(DoubleWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        XCTAssertEqualObjects(@3e-100, result.field1);
        XCTAssertEqualObjects(@-5e-57, result.field56ZerosAfterTheDotAndNegativeZeroBeforeDotAndThisIsALongFieldNameOnPurpose);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_putDoulbe {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    DoubleWrapper* input = [DoubleWrapper new];
    input.field1 = @3e-100;
    input.field56ZerosAfterTheDotAndNegativeZeroBeforeDotAndThisIsALongFieldNameOnPurpose = @-0.000000000000000000000000000000000000000000000000000000005;
    
    [op putDoubleWithComplexBody:(DoubleWrapper *) input withCallback:^(OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_getBool {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    [op getBoolWithCallback:^(BooleanWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        XCTAssertEqualObjects(@TRUE, [result.fieldTrue asNSNumber]);
        XCTAssertEqualObjects(@FALSE, [result.fieldFalse asNSNumber]);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_putBool {
    
//    NSDictionary *foo = @{
//                          @"boolean": @YES
//                          };
//    NSMutableDictionary *md = [NSMutableDictionary new];
//    md[@"boolean"] = @YES;
//
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:md options:0 error:nil];
//    NSString *rendered = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    NSLog(@"JSON:\n%@", rendered);
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    BooleanWrapper* input = [BooleanWrapper new];
    input.fieldTrue = [[AZBoolean alloc] initWithTRUE];
    input.fieldFalse = [[AZBoolean alloc] initWithFALSE];
    
    [op putBoolWithComplexBody:(BooleanWrapper *) input withCallback:^(OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_getString {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    [op getStringWithCallback:^(StringWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        XCTAssertEqualObjects(@"goodrequest", result.field);
        XCTAssertEqualObjects(@"", result.empty);
        XCTAssertEqualObjects([NSNull null], result.null);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_putString {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    StringWrapper* input = [StringWrapper new];
    input.field = @"goodrequest";
    input.empty = @"";
    input.null = nil;
    
    [op putStringWithComplexBody:(StringWrapper *) input withCallback:^(OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_getDate {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    [op getDateWithCallback:^(DateWrapper* result, OperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        
        XCTAssertEqual(2016, result.leap.year);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}


- (void)test_Privimive_putDate {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    DateWrapper* dateWrapper = [DateWrapper new];
    
    
    dateWrapper.field = [[Date alloc] initFromString:@"0001-01-01"];
    dateWrapper.leap = [[Date alloc] initFromString:@"2016-02-29"];
    
    NSLog(@"%@ %@", [dateWrapper.field toString], [dateWrapper.leap toString]);
    
    [op putDateWithComplexBody:dateWrapper withCallback:^(OperationError *error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_getDateTime {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    [op getDateTimeWithCallback:^(DatetimeWrapper* result, OperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        
        XCTAssertEqual(2015, result.now.year);
        XCTAssertEqual(5, result.now.month);
        XCTAssertEqual(18, result.now.day);
        XCTAssertEqual(18, result.now.hour);
        XCTAssertEqual(38, result.now.minute);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_putDateTime {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    DatetimeWrapper* dateTimeWrapper = [DatetimeWrapper new];
    
    
    dateTimeWrapper.field = [[DateTime alloc] initFromString:@"0001-01-01T12:00:00-04:00"];
    dateTimeWrapper.now = [[DateTime alloc] initFromString:@"2015-05-18T11:38:00-08:00"];
    
    NSLog(@"\n===%@ %@", [dateTimeWrapper.field toString], [dateTimeWrapper.now toString]);
    
    [op putDateTimeWithComplexBody:dateTimeWrapper withCallback:^(OperationError *error) {
        [waitingLoading fulfill];
        //XCTAssertNil(error, @"%@", error.reason);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_getByte {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    [op getByteWithCallback:^(ByteWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        Byte expectedArray[] = {0xFF, 0xFE, 0xFD, 0xFC, 0x00, 0xFA, 0xF9, 0xF8, 0xF7, 0xF6};
        NSData* expectedData = [NSData dataWithBytes:expectedArray
                                          length:sizeof(expectedArray)/sizeof(*expectedArray)];

        XCTAssertEqualObjects(expectedData, result.field);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Privimive_putByte {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PrimitivesProtocol> op =[self.service primitives];
    
    ByteWrapper* input = [ByteWrapper new];
    Byte arr[] = {0xFF, 0xFE, 0xFD, 0xFC, 0x00, 0xFA, 0xF9, 0xF8, 0xF7, 0xF6};
    input.field = [NSData dataWithBytes:arr
                                 length:sizeof(arr)/sizeof(*arr)];
    
    [op putByteWithComplexBody:(ByteWrapper *) input withCallback:^(OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Array_getValid {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<ArraysProtocol> op =[self.service arrays];
    
    [op getValidWithCallback:^(ArrayWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        NSArray* expected = @[
                              @"1, 2, 3, 4",
                              @"",
                              [NSNull new],
                              @"&S#$(*Y",
                              @"The quick brown fox jumps over the lazy dog"
                              ];
        
        XCTAssertEqualObjects(expected, result.array);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Array_putValid {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<ArraysProtocol> op =[self.service arrays];
    
    ArrayWrapper* complexBody = [ArrayWrapper new];
    complexBody.array = @[
                    @"1, 2, 3, 4",
                    @"",
                    [NSNull new],
                    @"&S#$(*Y",
                    @"The quick brown fox jumps over the lazy dog"
                    ];
    
    [op putValidWithComplexBody:complexBody
                   withCallback:^(OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
                       
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Array_getEmpty {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<ArraysProtocol> op =[self.service arrays];
    
    [op getEmptyWithCallback:^(ArrayWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        NSArray* expected = @[];
        
        XCTAssertEqualObjects(expected, result.array);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Array_putEmpty {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<ArraysProtocol> op =[self.service arrays];
    
    ArrayWrapper* complexBody = [ArrayWrapper new];
    complexBody.array = @[];
    
    [op putEmptyWithComplexBody:complexBody
                   withCallback:^(OperationError * error) {
                       
                       [waitingLoading fulfill];
                       XCTAssertNil(error, @"%@", error.reason);
                       
                   }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Array_getNotProvided {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<ArraysProtocol> op =[self.service arrays];
    
    [op getNotProvidedWithCallback:^(ArrayWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        NSArray* expected = nil;
        
        XCTAssertEqualObjects(expected, result.array);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Dictionary_getValid {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<DictionarysProtocol> op =[self.service dictionarys];
    
    [op getValidWithCallback:^(DictionaryWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        NSDictionary* expected = @{
                                   @"txt":@"notepad",
                                   @"bmp":@"mspaint",
                                   @"xls":@"excel",
                                   @"exe":@"",
                                   @"": [NSNull new]
                                   };
        
        XCTAssertEqualObjects(expected, result.defaultProgram);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Dictionary_putValid {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<DictionarysProtocol> op =[self.service dictionarys];
    
    DictionaryWrapper* complexBody = [DictionaryWrapper new];
    complexBody.defaultProgram = @{
                                   @"txt":@"notepad",
                                   @"bmp":@"mspaint",
                                   @"xls":@"excel",
                                   @"exe":@"",
                                   @"": [NSNull new]
                                   };
    
    [op putValidWithComplexBody:complexBody
                   withCallback:^(OperationError * error) {
                       
                       [waitingLoading fulfill];
                       
                       XCTAssertNil(error, @"%@", error.reason);
                       
                   }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Dictionary_getEmpty {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<DictionarysProtocol> op =[self.service dictionarys];
    
    [op getEmptyWithCallback:^(DictionaryWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        NSDictionary* expected = @{};
        
        XCTAssertEqualObjects(expected, result.defaultProgram);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Dictionary_putEmpty {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<DictionarysProtocol> op =[self.service dictionarys];
    
    DictionaryWrapper* complexBody = [DictionaryWrapper new];
    complexBody.defaultProgram = @{};
    
    [op putEmptyWithComplexBody:complexBody
                   withCallback:^(OperationError * error) {
                       
                       [waitingLoading fulfill];
                       
                       XCTAssertNil(error, @"%@", error.reason);
                   }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Dictionary_getNull {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<DictionarysProtocol> op =[self.service dictionarys];
    
    [op getEmptyWithCallback:^(DictionaryWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        NSDictionary* expected = @{};
        
        XCTAssertEqualObjects(expected, result.defaultProgram);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Dictionary_getNotProvided {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<DictionarysProtocol> op =[self.service dictionarys];
    
    [op getNotProvidedWithCallback:^(DictionaryWrapper * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        NSDictionary* expected = nil;
        
        XCTAssertEqualObjects(expected, result.defaultProgram);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Inheritance_getValid {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<InheritancesProtocol> op =[self.service inheritances];
    
    [op getValidWithCallback:^(Siamese * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        
        Siamese* expected = [Siamese new];
        //"breed":"persian","color":"green","hates":[{"food":"tomato","id":1,"name":"Potato"},{"food":"french fries","id":-1,"name":"Tomato"}],"id":2,"name":"Siameeee"}
        expected.breed = @"persian";
        expected.color = @"green";
        expected.name = @"Siameeee";
        expected.idProperty = @2;
        
        expected.hates = @[[Dog new], [Dog new]];
        
        expected.hates[0].name = @"Potato";
        expected.hates[0].idProperty = @1;
        expected.hates[0].food = @"tomato";

        expected.hates[1].name = @"Tomato";
        expected.hates[1].idProperty = @-1;
        expected.hates[1].food = @"french fries";
        
        XCTAssertEqualObjects(expected.idProperty, result.idProperty);
        XCTAssertEqualObjects(expected.breed, result.breed);
        XCTAssertEqualObjects(expected.name, result.name);
        XCTAssertEqualObjects(expected.color, result.color);
        
        XCTAssertEqualObjects(expected.hates[0].name, result.hates[0].name);
        XCTAssertEqualObjects(expected.hates[0].food, result.hates[0].food);
        XCTAssertEqualObjects(expected.hates[0].idProperty, result.hates[0].idProperty);
        
        XCTAssertEqualObjects(expected.hates[1].name, result.hates[1].name);
        XCTAssertEqualObjects(expected.hates[1].food, result.hates[1].food);
        XCTAssertEqualObjects(expected.hates[1].idProperty, result.hates[1].idProperty);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Inheritance_putValid {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<InheritancesProtocol> op =[self.service inheritances];
    
    Siamese* complexBody = [Siamese new];
    complexBody.breed = @"persian";
    complexBody.color = @"green";
    complexBody.name = @"Siameeee";
    complexBody.idProperty = @2;
    
    complexBody.hates = @[[Dog new], [Dog new]];
    
    complexBody.hates[0].name = @"Potato";
    complexBody.hates[0].idProperty = @1;
    complexBody.hates[0].food = @"tomato";
    
    complexBody.hates[1].name = @"Tomato";
    complexBody.hates[1].idProperty = @-1;
    complexBody.hates[1].food = @"french fries";
    
    [op putValidWithComplexBody:complexBody
                   withCallback:^(OperationError * error) {
                       
                       [waitingLoading fulfill];
                       
                       XCTAssertNil(error, @"%@", error.reason);
                       
                   }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Polymorphism_getValid {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<PolymorphismsProtocol> op =[self.service polymorphisms];
    
    [op getValidWithCallback:^(Fish * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        
//        Siamese* expected = [Siamese new];erty);
        
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Polymorphism_putValid {
    
//    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
//
//    id<InheritancesProtocol> op =[self.service inheritances];
//
//    Siamese* complexBody = [Siamese new];
//
//    [op putValidWithComplexBody:complexBody
//                   withCallback:^(OperationError * error) {
//
//                       [waitingLoading fulfill];
//
//                       XCTAssertNil(error, @"%@", error.reason);
//
//                   }];
//
//    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
//        if (error) {
//            XCTFail(@"After block was not called.");
//        }
//    }];
}


- (void)test_Readonlyproperty_getValid {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<ReadonlypropertysProtocol> op =[self.service readonlypropertys];
    
    [op getValidWithCallback:^(ReadonlyObj * result, OperationError * error) {
        
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
        XCTAssertNotNil(result);
        XCTAssertEqualObjects(@"1234", result.idProperty);
        XCTAssertEqualObjects(@2, result.size);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Readonlyproperty_putValid {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<ReadonlypropertysProtocol> op =[self.service readonlypropertys];
    
    ReadonlyObj* input = [[ReadonlyObj alloc] initIdProperty:@"read-only-means-we-dont-encode-it"];
    //ReadonlyObj* input = [ReadonlyObj new];
    input.size = @2;
    
    [op putValidWithComplexBody:(ReadonlyObj *) input withCallback:^(OperationError * error) {
        
        [waitingLoading fulfill];
        // to pass - the server wants {"size":2} not {"id":null,"size":2}
        XCTAssertNil(error, @"%@", error.reason);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)test_Flattencomplex_getValid_getValid {
    
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    
    id<FlattencomplexsProtocol> op =[self.service flattencomplexs];
    
    [op getValidWithCallback:^(MyBaseType * result, OperationError * error) {
        
        [waitingLoading fulfill];
        //XCTAssertNil(error, @"domain: %@, reason: %@", error.domain, error.reason);
        //XCTAssertNotNil(result);
        //XCTAssertEqualObjects(@"1234", result.idProperty);
        //XCTAssertEqualObjects(@2, result.size);
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"After block was not called.");
        }
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
