/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import <XCTest/XCTest.h>
#import <AzureClientRuntime/AzureClientRuntime.h>
#import "CLX_AutoRestComplexTestServiceService.h"

@interface CLX_AutoRestComplexTestServiceServiceTests : XCTestCase
    @property id<CLX_AutoRestComplexTestServiceServiceProtocol> service;
@end
@implementation CLX_AutoRestComplexTestServiceServiceTests
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.continueAfterFailure = NO;
    self.service = [CLX_AutoRestComplexTestServiceService createWithApiVersion:@""];
}
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

//>>>> CLX_Basics basics


/**
 * Get complex type {id: 2, name: 'abc', color: 'YELLOW'}.
 *
 */
- (void) test_basics_getValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_BasicsProtocol> op = [self.service basics];
    [op getValidWithCallback:^(CLX_Basic* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Please put {id: 2, name: 'abc', color: 'Magenta'}.
 *
 * body parameter: complexBody Please put {id: 2, name: 'abc', color: 'Magenta'}
 */
- (void) test_basics_putValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_BasicsProtocol> op = [self.service basics];
    CLX_Basic* complexBody = nil;
    [op putValidWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get a basic complex type that is invalid for the local strong type.
 *
 */
- (void) test_basics_getInvalid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_BasicsProtocol> op = [self.service basics];
    [op getInvalidWithCallback:^(CLX_Basic* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get a basic complex type that is empty.
 *
 */
- (void) test_basics_getEmpty {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_BasicsProtocol> op = [self.service basics];
    [op getEmptyWithCallback:^(CLX_Basic* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get a basic complex type whose properties are null.
 *
 */
- (void) test_basics_getNull {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_BasicsProtocol> op = [self.service basics];
    [op getNullWithCallback:^(CLX_Basic* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get a basic complex type while the server doesn't provide a response payload.
 *
 */
- (void) test_basics_getNotProvided {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_BasicsProtocol> op = [self.service basics];
    [op getNotProvidedWithCallback:^(CLX_Basic* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

//>>>> CLX_Primitives primitives


/**
 * Get complex types with integer properties.
 *
 */
- (void) test_primitives_getInt {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    [op getIntWithCallback:^(CLX_IntWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with integer properties.
 *
 * body parameter: complexBody Please put -1 and 2
 */
- (void) test_primitives_putInt {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    CLX_IntWrapper* complexBody = nil;
    [op putIntWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with long properties.
 *
 */
- (void) test_primitives_getLong {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    [op getLongWithCallback:^(CLX_LongWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with long properties.
 *
 * body parameter: complexBody Please put 1099511627775 and -999511627788
 */
- (void) test_primitives_putLong {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    CLX_LongWrapper* complexBody = nil;
    [op putLongWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with float properties.
 *
 */
- (void) test_primitives_getFloat {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    [op getFloatWithCallback:^(CLX_FloatWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with float properties.
 *
 * body parameter: complexBody Please put 1.05 and -0.003
 */
- (void) test_primitives_putFloat {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    CLX_FloatWrapper* complexBody = nil;
    [op putFloatWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with double properties.
 *
 */
- (void) test_primitives_getDouble {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    [op getDoubleWithCallback:^(CLX_DoubleWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with double properties.
 *
 * body parameter: complexBody Please put 3e-100 and -0.000000000000000000000000000000000000000000000000000000005
 */
- (void) test_primitives_putDouble {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    CLX_DoubleWrapper* complexBody = nil;
    [op putDoubleWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with bool properties.
 *
 */
- (void) test_primitives_getBool {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    [op getBoolWithCallback:^(CLX_BooleanWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with bool properties.
 *
 * body parameter: complexBody Please put true and false
 */
- (void) test_primitives_putBool {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    CLX_BooleanWrapper* complexBody = nil;
    [op putBoolWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with string properties.
 *
 */
- (void) test_primitives_getString {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    [op getStringWithCallback:^(CLX_StringWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with string properties.
 *
 * body parameter: complexBody Please put 'goodrequest', '', and null
 */
- (void) test_primitives_putString {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    CLX_StringWrapper* complexBody = nil;
    [op putStringWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with date properties.
 *
 */
- (void) test_primitives_getDate {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    [op getDateWithCallback:^(CLX_DateWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with date properties.
 *
 * body parameter: complexBody Please put '0001-01-01' and '2016-02-29'
 */
- (void) test_primitives_putDate {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    CLX_DateWrapper* complexBody = nil;
    [op putDateWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with datetime properties.
 *
 */
- (void) test_primitives_getDateTime {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    [op getDateTimeWithCallback:^(CLX_DatetimeWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with datetime properties.
 *
 * body parameter: complexBody Please put '0001-01-01T12:00:00-04:00' and '2015-05-18T11:38:00-08:00'
 */
- (void) test_primitives_putDateTime {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    CLX_DatetimeWrapper* complexBody = nil;
    [op putDateTimeWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with datetimeRfc1123 properties.
 *
 */
- (void) test_primitives_getDateTimeRfc1123 {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    [op getDateTimeRfc1123WithCallback:^(CLX_Datetimerfc1123Wrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with datetimeRfc1123 properties.
 *
 * body parameter: complexBody Please put 'Mon, 01 Jan 0001 12:00:00 GMT' and 'Mon, 18 May 2015 11:38:00 GMT'
 */
- (void) test_primitives_putDateTimeRfc1123 {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    CLX_Datetimerfc1123Wrapper* complexBody = nil;
    [op putDateTimeRfc1123WithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with duration properties.
 *
 */
- (void) test_primitives_getDuration {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    [op getDurationWithCallback:^(CLX_DurationWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with duration properties.
 *
 * body parameter: complexBody Please put 'P123DT22H14M12.011S'
 */
- (void) test_primitives_putDuration {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    CLX_DurationWrapper* complexBody = nil;
    [op putDurationWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with byte properties.
 *
 */
- (void) test_primitives_getByte {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    [op getByteWithCallback:^(CLX_ByteWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with byte properties.
 *
 * body parameter: complexBody Please put non-ascii byte string hex(FF FE FD FC 00 FA F9 F8 F7 F6)
 */
- (void) test_primitives_putByte {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PrimitivesProtocol> op = [self.service primitives];
    CLX_ByteWrapper* complexBody = nil;
    [op putByteWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}


//>>>> CLX_Arrays arrays


/**
 * Get complex types with array property.
 *
 */
- (void) test_arrays_getValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_ArraysProtocol> op = [self.service arrays];
    [op getValidWithCallback:^(CLX_ArrayWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with array property.
 *
 * body parameter: complexBody Please put an array with 4 items: "1, 2, 3, 4", "", null, "&S#$(*Y", "The quick brown fox jumps over the lazy dog"
 */
- (void) test_arrays_putValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_ArraysProtocol> op = [self.service arrays];
    CLX_ArrayWrapper* complexBody = nil;
    [op putValidWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with array property which is empty.
 *
 */
- (void) test_arrays_getEmpty {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_ArraysProtocol> op = [self.service arrays];
    [op getEmptyWithCallback:^(CLX_ArrayWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with array property which is empty.
 *
 * body parameter: complexBody Please put an empty array
 */
- (void) test_arrays_putEmpty {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_ArraysProtocol> op = [self.service arrays];
    CLX_ArrayWrapper* complexBody = nil;
    [op putEmptyWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with array property while server doesn't provide a response payload.
 *
 */
- (void) test_arrays_getNotProvided {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_ArraysProtocol> op = [self.service arrays];
    [op getNotProvidedWithCallback:^(CLX_ArrayWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}


//>>>> CLX_Dictionarys dictionarys


/**
 * Get complex types with dictionary property.
 *
 */
- (void) test_dictionarys_getValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_DictionarysProtocol> op = [self.service dictionarys];
    [op getValidWithCallback:^(CLX_DictionaryWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with dictionary property.
 *
 * body parameter: complexBody Please put a dictionary with 5 key-value pairs: "txt":"notepad", "bmp":"mspaint", "xls":"excel", "exe":"", "":null
 */
- (void) test_dictionarys_putValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_DictionarysProtocol> op = [self.service dictionarys];
    CLX_DictionaryWrapper* complexBody = nil;
    [op putValidWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with dictionary property which is empty.
 *
 */
- (void) test_dictionarys_getEmpty {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_DictionarysProtocol> op = [self.service dictionarys];
    [op getEmptyWithCallback:^(CLX_DictionaryWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types with dictionary property which is empty.
 *
 * body parameter: complexBody Please put an empty dictionary
 */
- (void) test_dictionarys_putEmpty {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_DictionarysProtocol> op = [self.service dictionarys];
    CLX_DictionaryWrapper* complexBody = nil;
    [op putEmptyWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with dictionary property which is null.
 *
 */
- (void) test_dictionarys_getNull {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_DictionarysProtocol> op = [self.service dictionarys];
    [op getNullWithCallback:^(CLX_DictionaryWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types with dictionary property while server doesn't provide a response payload.
 *
 */
- (void) test_dictionarys_getNotProvided {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_DictionarysProtocol> op = [self.service dictionarys];
    [op getNotProvidedWithCallback:^(CLX_DictionaryWrapper* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}


//>>>> CLX_Inheritances inheritances


/**
 * Get complex types that extend others.
 *
 */
- (void) test_inheritances_getValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_InheritancesProtocol> op = [self.service inheritances];
    [op getValidWithCallback:^(CLX_Siamese* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types that extend others.
 *
 * body parameter: complexBody Please put a siamese with id=2, name="Siameee", color=green, breed=persion, which hates 2 dogs, the 1st one named "Potato" with id=1 and food="tomato", and the 2nd one named "Tomato" with id=-1 and food="french fries".
 */
- (void) test_inheritances_putValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_InheritancesProtocol> op = [self.service inheritances];
    CLX_Siamese* complexBody = nil;
    [op putValidWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}


//>>>> CLX_Polymorphisms polymorphisms


/**
 * Get complex types that are polymorphic.
 *
 */
- (void) test_polymorphisms_getValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PolymorphismsProtocol> op = [self.service polymorphisms];
    [op getValidWithCallback:^(CLX_Fish* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types that are polymorphic.
 *
 * body parameter: complexBody Please put a salmon that looks like this:
 {
         'fishtype':'Salmon',
         'location':'alaska',
         'iswild':true,
         'species':'king',
         'length':1.0,
         'siblings':[
           {
             'fishtype':'Shark',
             'age':6,
             'birthday': '2012-01-05T01:00:00Z',
             'length':20.0,
             'species':'predator',
           },
           {
             'fishtype':'Sawshark',
             'age':105,
             'birthday': '1900-01-05T01:00:00Z',
             'length':10.0,
             'picture': new Buffer([255, 255, 255, 255, 254]).toString('base64'),
             'species':'dangerous',
           },
           {
             'fishtype': 'goblin',
             'age': 1,
             'birthday': '2015-08-08T00:00:00Z',
             'length': 30.0,
             'species': 'scary',
             'jawsize': 5
           }
         ]
       };
 */
- (void) test_polymorphisms_putValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PolymorphismsProtocol> op = [self.service polymorphisms];
    CLX_Fish* complexBody = nil;
    [op putValidWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Get complex types that are polymorphic, but not at the root of the hierarchy; also have additional properties.
 *
 */
- (void) test_polymorphisms_getComplicated {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PolymorphismsProtocol> op = [self.service polymorphisms];
    [op getComplicatedWithCallback:^(CLX_Salmon* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types that are polymorphic, but not at the root of the hierarchy; also have additional properties.
 *
 * body parameter: complexBody the CLX_Salmon value
 */
- (void) test_polymorphisms_putComplicated {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PolymorphismsProtocol> op = [self.service polymorphisms];
    CLX_Salmon* complexBody = nil;
    [op putComplicatedWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types that are polymorphic, omitting the discriminator.
 *
 * body parameter: complexBody the CLX_Salmon value
 */
- (void) test_polymorphisms_putMissingDiscriminator {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PolymorphismsProtocol> op = [self.service polymorphisms];
    CLX_Salmon* complexBody = nil;
    [op putMissingDiscriminatorWithComplexBody:complexBody withCallback:^(CLX_Salmon* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types that are polymorphic, attempting to omit required 'birthday' field - the request should not be allowed from the client.
 *
 * body parameter: complexBody Please attempt put a sawshark that looks like this, the client should not allow this data to be sent:
 {
     "fishtype": "sawshark",
     "species": "snaggle toothed",
     "length": 18.5,
     "age": 2,
     "birthday": "2013-06-01T01:00:00Z",
     "location": "alaska",
     "picture": base64(FF FF FF FF FE),
     "siblings": [
         {
             "fishtype": "shark",
             "species": "predator",
             "birthday": "2012-01-05T01:00:00Z",
             "length": 20,
             "age": 6
         },
         {
             "fishtype": "sawshark",
             "species": "dangerous",
             "picture": base64(FF FF FF FF FE),
             "length": 10,
             "age": 105
         }
     ]
 }
 */
- (void) test_polymorphisms_putValidMissingRequired {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PolymorphismsProtocol> op = [self.service polymorphisms];
    CLX_Fish* complexBody = nil;
    [op putValidMissingRequiredWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}


//>>>> CLX_Polymorphicrecursives polymorphicrecursives


/**
 * Get complex types that are polymorphic and have recursive references.
 *
 */
- (void) test_polymorphicrecursives_getValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PolymorphicrecursivesProtocol> op = [self.service polymorphicrecursives];
    [op getValidWithCallback:^(CLX_Fish* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types that are polymorphic and have recursive references.
 *
 * body parameter: complexBody Please put a salmon that looks like this:
 {
     "fishtype": "salmon",
     "species": "king",
     "length": 1,
     "age": 1,
     "location": "alaska",
     "iswild": true,
     "siblings": [
         {
             "fishtype": "shark",
             "species": "predator",
             "length": 20,
             "age": 6,
             "siblings": [
                 {
                     "fishtype": "salmon",
                     "species": "coho",
                     "length": 2,
                     "age": 2,
                     "location": "atlantic",
                     "iswild": true,
                     "siblings": [
                         {
                             "fishtype": "shark",
                             "species": "predator",
                             "length": 20,
                             "age": 6
                         },
                         {
                             "fishtype": "sawshark",
                             "species": "dangerous",
                             "length": 10,
                             "age": 105
                         }
                     ]
                 },
                 {
                     "fishtype": "sawshark",
                     "species": "dangerous",
                     "length": 10,
                     "age": 105
                 }
             ]
         },
         {
             "fishtype": "sawshark",
             "species": "dangerous",
             "length": 10,
             "age": 105
         }
     ]
 }
 */
- (void) test_polymorphicrecursives_putValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_PolymorphicrecursivesProtocol> op = [self.service polymorphicrecursives];
    CLX_Fish* complexBody = nil;
    [op putValidWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}


//>>>> CLX_Readonlypropertys readonlypropertys


/**
 * Get complex types that have readonly properties.
 *
 */
- (void) test_readonlypropertys_getValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_ReadonlypropertysProtocol> op = [self.service readonlypropertys];
    [op getValidWithCallback:^(CLX_ReadonlyObj* result, AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}

/**
 * Put complex types that have readonly properties.
 *
 * body parameter: complexBody the CLX_ReadonlyObj value
 */
- (void) test_readonlypropertys_putValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_ReadonlypropertysProtocol> op = [self.service readonlypropertys];
    CLX_ReadonlyObj* complexBody = nil;
    [op putValidWithComplexBody:complexBody withCallback:^(AZOperationError* error) {
        [waitingLoading fulfill];
        XCTAssertNil(error, @"%@", error.reason);
    }];
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if (error) {XCTFail(@"After block was not called.");}
    }];
}


//>>>> CLX_Flattencomplexs flattencomplexs


/**
 *
 */
- (void) test_flattencomplexs_getValid {
    XCTestExpectation *waitingLoading = [self expectationWithDescription:@"Wait for HTTP request to complete"];
    id<CLX_FlattencomplexsProtocol> op = [self.service flattencomplexs];
    [op getValidWithCallback:^(CLX_MyBaseType* result, AZOperationError* error) {
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
