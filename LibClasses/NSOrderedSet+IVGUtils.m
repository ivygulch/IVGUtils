//
//  NSSet+IVGUtils.m
//  IVGUtils
//
//  Created by Douglas Sjoquist on 3/19/11.
//  Copyright 2011 Ivy Gulch, LLC. All rights reserved.
//

#import "NSOrderedSet+IVGUtils.h"
#import "NSArray+IVGUtils.h"

@implementation NSOrderedSet (IVGUtils)

- (NSArray *) randomizedArray {
    return [[self array] arrayByRandomizing];
}

- (NSOrderedSet *) randomizedOrderedSet;
{
    return [NSOrderedSet orderedSetWithArray:[self randomizedArray]];
}

@end
