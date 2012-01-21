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

- (void) testGUIDRetain {
    NSString *guid = [[NSString GUID] retain];
    
    GHAssertEquals([guid retainCount], (NSUInteger) 2, @"guid is created with autorelease, so after a retain, retainCount should be 2");

    [guid release];
}

- (void) testGUIDUniqueness {
    NSString *guid1 = [NSString GUID];
    NSString *guid2 = [NSString GUID];
    GHAssertNotEquals(guid1, guid2, @"guid strings should be unique");
}

- (void) check:(NSString *) s expectHaveValue:(BOOL) expectHaveValue {
    BOOL actualHaveValue = [s haveValue];
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

@end

