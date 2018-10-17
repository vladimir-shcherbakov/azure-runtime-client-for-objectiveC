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

@interface JsonCoderTests : XCTestCase

@end

@implementation JsonCoderTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testSimpleModel {
    SimpleModel* sm = [SimpleModel new];
    sm.simpleString = @"this is a string for simple";
    sm.simpleNumber = @15;
    
    NSData* data = [JsonCoder encodeObject:sm];
    NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"\n=== testSimpleModel:\n %@", str);
    
    XCTAssertEqualObjects(@"{\"simpleNumber\":15,\"simpleString\":\"this is a string for simple\"}", str);
    
    SimpleModel* sm1 = [JsonCoder decodeData:data objectClass:[SimpleModel class]];
    
    XCTAssertEqualObjects(sm.simpleNumber, sm1.simpleNumber);
    XCTAssertEqualObjects(sm.simpleString, sm1.simpleString);
}

- (void)testComplexModel {
    
    SimpleModel* sm = [SimpleModel new];

    sm.simpleString = @"this is a string for simple";
    sm.simpleNumber = @1E+34;
    
    ComplexModel* cm = [ComplexModel new];
    cm.baseDict = @{ @"baseName1": sm, @"baseName2": sm, @"baseName3": sm};
    cm.baseString = @"This is string for base";
    cm.baseNumber = @777.345;
    cm.baseArray = @[sm, sm, sm];
    
    cm.baseSimpleModel = sm;
    cm.complexSimpleModel = sm;
    cm.comlexArray = @[sm, sm, sm];
    cm.complexDict = @{@"complName1":sm,@"complName2": sm,@"complName3":sm};
    
    NSData* data = [JsonCoder encodeObject:cm];
    NSLog(@"\n=== JsonCoderResult: %@", [NSString stringWithUTF8String:[data bytes]]);
    
}


@end
