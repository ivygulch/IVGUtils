//
//  IVGTypeMapTest.m
//
//  Created by Douglas Sjoquist on 1/22/11.
//  Copyright 2011 Sunetos, Inc. All rights reserved.
//

#import <GHUnitIOS/GHUnitIOS.h>
#import <OCMock/OCMock.h>
#import "IVGTypeMap.h"

@interface IVGTypeMapTest : GHTestCase
@property (nonatomic,strong) IVGTypeMap *typeMap;
@end

@implementation IVGTypeMapTest

- (void) setUp;
{
    self.typeMap = [[IVGTypeMap alloc] initWithDictionary:
                    @{
                    @(UIViewContentModeScaleToFill):@"scaleToFill",
                    @(UIViewContentModeScaleAspectFit):@"scaleAspectFit",
                    @(UIViewContentModeScaleAspectFill):@"scaleAspectFill",
                    @(UIViewContentModeRedraw):@"redraw",
                    @(UIViewContentModeCenter):@"center",
                    @(UIViewContentModeTop):@"top",
                    @(UIViewContentModeBottom):@"bottom",
                    @(UIViewContentModeLeft):@"left",
                    @(UIViewContentModeRight):@"right",
                    @(UIViewContentModeTopLeft):@"topLeft",
                    @(UIViewContentModeTopRight):@"topRight",
                    @(UIViewContentModeBottomLeft):@"bottomLeft",
                    @(UIViewContentModeBottomRight):@"bottomRight",
                    }];
}

- (void) testValidDescriptionForType;
{
    NSString *actual = [self.typeMap descriptionForType:UIViewContentModeTop];
    GHAssertEqualStrings(actual, @"top", @"should find result");
}

- (void) testInvalidDescriptionForType;
{
    NSString *actual = [self.typeMap descriptionForType:NSIntegerMin];
    GHAssertNil(actual, @"should not find result");
}

- (void) testValidTypeForDescription;
{
    UIViewContentMode actual = [self.typeMap typeForDescription:@"top"];
    GHAssertEquals(actual, UIViewContentModeTop, @"should find result");
}

- (void) testInvalidTypeToDescription;
{
    UIViewContentMode actual = [self.typeMap typeForDescription:@"invalid"];
    GHAssertEquals(actual, NSNotFound, @"should not find result");
}

@end

