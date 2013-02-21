//
//  NSArray+IVGUtils.h
//  IVGUtils
//
//  Created by Douglas Sjoquist on 3/19/11.
//  Copyright 2011 Ivy Gulch, LLC. All rights reserved.
//

#import "NSArray+IVGUtils.h"
#import <math.h>

@implementation NSArray (IVGUtils)

- (NSArray *) randomized {
    NSMutableArray *arrayCopy = [NSMutableArray arrayWithArray:self];
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[self count]];
    while ([arrayCopy count] > 0) {
        int idx = arc4random() % [arrayCopy count];
        [result addObject:[arrayCopy objectAtIndex:idx]];
        [arrayCopy removeObjectAtIndex:idx];
    }
    return result;
}

- (NSArray *) reversedArray {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [array addObject:element];
    }
    return array;
}

- (NSArray *) filterArray:(BOOL (^)(id element)) filterBlock;
{
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (filterBlock(obj)) {
            [result addObject:obj];
        }
    }];
    return [NSArray arrayWithArray:result];
}

- (id) objectAtIndex:(NSUInteger) index outOfRange:(id) outOfRangeValue
{
    if (index < [self count]) {
        return [self objectAtIndex:index];
    } else {
        return outOfRangeValue;
    }
}

- (NSString *) descriptionDelimitedBy:(NSString *) delimiter;
{
    NSMutableString *ms = [NSMutableString string];
    NSString *sep = @"[";
    for (id value in self) {
        [ms appendString:sep];
        [ms appendString:[NSString stringWithFormat:@"%@", value]];
        sep = delimiter;
    }
    [ms appendString:@"]"];
    return [NSString stringWithString:ms];
}


+ (NSArray *) sortDescriptors:(NSString *)firstKey, ...  {
    NSMutableArray *result = [NSMutableArray array];
    
    va_list args;
    va_start(args, firstKey);
    for (NSString *arg = firstKey; arg != nil; arg = va_arg(args, NSString*)) {
        NSString *key = arg;
        BOOL ascending = YES;
        if ([key hasPrefix:@"-"]) {
            key = [key substringFromIndex:1];
            ascending = NO;
        }
        [result addObject:[[NSSortDescriptor alloc] initWithKey:key ascending:ascending]];
    }
    va_end(args);
    
    return result;
}

- (UIColor *) UIColorFromRGBValues;
{
    CGFloat r = [[self objectAtIndex:0 outOfRange:nil] floatValue];
    CGFloat g = [[self objectAtIndex:1 outOfRange:nil] floatValue];
    CGFloat b = [[self objectAtIndex:2 outOfRange:nil] floatValue];
    CGFloat a = [[self objectAtIndex:3 outOfRange:@(1)] floatValue];

    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end

@implementation NSMutableArray (IGUtils)

- (BOOL) addIfNotNil:(id) item;
{
    return [self addObject:item ifBlock:^BOOL(id obj){return obj != nil;}];
}

- (BOOL) addObject:(id)item ifBlock:(BOOL(^)(id obj)) ifBlock;
{
    BOOL result = NO;
    if (ifBlock(item)) {
        [self addObject:item];
        result = YES;
    }
    return result;
}

@end
