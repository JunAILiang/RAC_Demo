//
//  RAC_BlockTests.m
//  RAC_BlockTests
//
//  Created by JM on 2018/4/14.
//  Copyright © 2018年 JM. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface RAC_BlockTests : XCTestCase

@end

@implementation RAC_BlockTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
