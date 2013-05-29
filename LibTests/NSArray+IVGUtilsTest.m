//
//  AlbumListLoadTest.m
//  EmptyBase
//
//  Created by Douglas Sjoquist on 1/22/11.
//  Copyright 2011 Sunetos, Inc. All rights reserved.
//

#import <GHUnitIOS/GHUnitIOS.h>
#import <OCMock/OCMock.h>
#import "NSArray+IVGUtils.h"

@interface NSArray_IVGUtilsTest : GHTestCase {
}

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
    NSMutableArray *original = [NSMutableArray arrayWithObjects:@"a", @"b", @"c", @"d", nil];

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

@end

