//
//  AlbumListLoadTest.m
//  EmptyBase
//
//  Created by Douglas Sjoquist on 1/22/11.
//  Copyright 2011 Sunetos, Inc. All rights reserved.
//

#import <GHUnitIOS/GHUnitIOS.h>
#import <OCMock/OCMock.h>
#import "NSDictionary+IVGUtils.h"

@interface NSDictionary_IVGUtilsTest : GHTestCase {
}

@end

@implementation NSDictionary_IVGUtilsTest

- (void) testCGRectValue;
{
    NSDictionary *d = @{@"X":@5,@"Y":@6,@"Width":@7,@"Height":@8};
    CGRect r = [d CGRectValue];
    GHAssertTrue(CGRectEqualToRect(r,CGRectMake(5,6,7,8)), @"CGRectValue");
}

- (void) testdictionaryWithCGRect;
{
    NSDictionary *d = [NSDictionary dictionaryWithCGRect:CGRectMake(1,2,3,4)];
    GHAssertEquals([d count], (NSUInteger)4, @"four elements");
    GHAssertEquals([[d objectForKey:@"X"] floatValue], 1.0f, @"X");
    GHAssertEquals([[d objectForKey:@"Y"] floatValue], 2.0f, @"Y");
    GHAssertEquals([[d objectForKey:@"Width"] floatValue], 3.0f, @"Width");
    GHAssertEquals([[d objectForKey:@"Height"] floatValue], 4.0f, @"Height");
}

@end

