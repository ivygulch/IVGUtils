//
//  AlbumListLoadTest.m
//  EmptyBase
//
//  Created by Douglas Sjoquist on 1/22/11.
//  Copyright 2011 Sunetos, Inc. All rights reserved.
//

#import <GHUnitIOS/GHUnitIOS.h>
#import <OCMock/OCMock.h>
#import "NSString+IVGUtils.h"

@interface NSString_IVGUtilsTest : GHTestCase {
}

@end

@implementation NSString_IVGUtilsTest

- (void) testUUIDUniqueness {
    NSString *guid1 = [NSString UUID];
    NSString *guid2 = [NSString UUID];
    GHAssertNotEquals(guid1, guid2, @"guid strings should be unique");
}

- (void) check:(NSString *) s expectHaveValue:(BOOL) expectHaveValue {
    BOOL actualHaveValue = [s hasValue];
    GHAssertEquals(actualHaveValue, expectHaveValue, @"string is %@", s);
}

- (void) testHaveValueWithNil {
    [self check:nil expectHaveValue:NO];
}

- (void) testHaveValueWithZeroLength {
    [self check:@"" expectHaveValue:NO];
}

- (void) testHaveValueWithSpace {
    [self check:@" " expectHaveValue:YES];
}

- (void) testHaveValueWithChars {
    [self check:@"abc" expectHaveValue:YES];
}
/*
- (void) checkValue:(int32_t) value bitCount:(NSUInteger) bitCount leftPad:(BOOL) leftPad expected:(NSString *) expected;
{
    NSString *actual = [NSString binaryStringWithInteger:value bitCount:bitCount leftPad:leftPad];
    GHAssertEqualStrings(actual, expected, @"value is %4.4X", value);
}

- (void) testBinaryStringAll32YES;
{
    [self checkValue:0xFFFFFFFF bitCount:32 leftPad:YES expected:@"11111111111111111111111111111111"];
}

- (void) testBinaryStringHalf32YES;
{
    [self checkValue:0x0000FFFF bitCount:32 leftPad:YES expected:@"00000000000000001111111111111111"];
}

- (void) testBinaryStringAll32NO;
{
    [self checkValue:0xFFFFFFFF bitCount:32 leftPad:NO expected:@"11111111111111111111111111111111"];
}

- (void) testBinaryStringHalf32NO;
{
    [self checkValue:0x0000FFFF bitCount:32 leftPad:NO expected:@"1111111111111111"];
}

- (void) testBinaryStringZero32NO;
{
    [self checkValue:0 bitCount:32 leftPad:NO expected:@"0"];
}
*/
@end

