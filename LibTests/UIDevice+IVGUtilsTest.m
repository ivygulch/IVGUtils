//
//  UIDevice_IVGUtilsTest.m
//  EmptyBase
//
//  Created by Douglas Sjoquist on 1/22/11.
//  Copyright 2011 Sunetos, Inc. All rights reserved.
//

#import <GHUnitIOS/GHUnitIOS.h>
#import <OCMock/OCMock.h>
#import "UIDevice+IVGUtils.h"

@interface UIDevice_IVGUtilsTest : GHTestCase {
}

@end

@implementation UIDevice_IVGUtilsTest

- (void) testIsRunningOnIPad {
    BOOL result = [UIDevice isRunningOniPad];
    NSLog(@"isRunningOnIpad = %u", result);
}

@end

