//
//  NSArray_IVGUtilsTest
//  EmptyBase
//
//  Created by Douglas Sjoquist on 1/22/11.
//  Copyright 2011 Sunetos, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+IVGUtils.h"

@interface NSArray_IVGUtilsTest : XCTestCase
@end

@implementation NSArray_IVGUtilsTest

- (NSString *) result:(NSArray *) array {
    NSMutableString *result = [NSMutableString stringWithCapacity:[array count]];
    for (id o in array) {
        [result appendFormat:@"%@", o];
    }
    return result;
}

- (void) testRandomized {
    NSArray *original = @[@"a", @"b", @"c", @"d"];

    NSMutableDictionary *resultCounts = [NSMutableDictionary dictionary];
    for (int idx=0; idx<1000; idx++) {
        NSArray *randomized = [original arrayByRandomizing];
        NSString *randomizedResult = [self result:randomized];
        NSNumber *count = [resultCounts valueForKey:randomizedResult];
        if (count) {
            count = [NSNumber numberWithInt:[count intValue]+1];
        } else {
            count = [NSNumber numberWithInt:1];
        }
        [resultCounts setValue:count forKey:randomizedResult];
    }
    
    NSLog(@"resultCounts\n%@", resultCounts);
}

- (void) testSubarraysWithSizeZero;
{
    NSArray *testArray = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    NSArray *subarrays = [testArray subarraysWithSubarraySize:0];
    NSArray *subarray0 = [subarrays firstObject];

    XCTAssertEqual(1, [subarrays count], @"should have one subarray");
    XCTAssertEqual([testArray count], [subarray0 count], @"should have same count as source");
    for (NSUInteger idx=0; idx<[testArray count]; idx++) {
        XCTAssertEqualObjects([testArray objectAtIndex:idx], [subarray0 objectAtIndex:idx], @"elements should  match");
    }
}

- (void) testSubarraysWithSizeOne;
{
    NSArray *testArray = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    NSArray *subarrays = [testArray subarraysWithSubarraySize:1];

    XCTAssertEqual([testArray count], [subarrays count], @"should have 11 subarrays");
    for (NSUInteger idx=0; idx<[testArray count]; idx++) {
        NSArray *subarray = [subarrays objectAtIndex:idx];
        XCTAssertEqual(1, [subarray count], @"should have one element");
        XCTAssertEqualObjects([testArray objectAtIndex:idx], [subarray objectAtIndex:0], @"elements should  match");
    }
}

- (void) expectArray:(NSArray *) array1 toMatch:(NSArray *) array2;
{
    XCTAssertEqual([array1 count], [array2 count], @"expected values: %@", array1);
    if ([array1 count] == [array2 count]) {
        for (NSUInteger idx=0; idx<[array1 count]; idx++) {
            XCTAssertEqualObjects([array1 objectAtIndex:idx], [array2 objectAtIndex:idx], @"array elements should match");
        }
    }
}

- (void) testSubarraysWithSizeTwo;
{
    NSArray *testArray = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    NSArray *subarrays = [testArray subarraysWithSubarraySize:2];

    XCTAssertEqual(6, [subarrays count], @"should have 6 subarrays");
    [self expectArray:@[@0, @1] toMatch:[subarrays objectAtIndex:0]];
    [self expectArray:@[@2, @3] toMatch:[subarrays objectAtIndex:1]];
    [self expectArray:@[@4, @5] toMatch:[subarrays objectAtIndex:2]];
    [self expectArray:@[@6, @7] toMatch:[subarrays objectAtIndex:3]];
    [self expectArray:@[@8, @9] toMatch:[subarrays objectAtIndex:4]];
    [self expectArray:@[@10] toMatch:[subarrays objectAtIndex:5]];
}

- (void) testSubarraysWithSizeSix;
{
    NSArray *testArray = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    NSArray *subarrays = [testArray subarraysWithSubarraySize:6];

    XCTAssertEqual(2, [subarrays count], @"should have 2 subarrays");
    [self expectArray:@[@0, @1, @2, @3, @4, @5] toMatch:[subarrays objectAtIndex:0]];
    [self expectArray:@[@6, @7, @8, @9, @10] toMatch:[subarrays objectAtIndex:1]];
}

- (void) testSubarraysWithSizeTwenty;
{
    NSArray *testArray = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    NSArray *subarrays = [testArray subarraysWithSubarraySize:20];

    XCTAssertEqual(1, [subarrays count], @"should have 1 subarray");
    [self expectArray:@[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10] toMatch:[subarrays objectAtIndex:0]];
}


@end

