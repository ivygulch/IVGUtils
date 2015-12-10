//
//  NSDictionary+IVGUtils.m
//  IVGUtils
//
//  Created by Douglas Sjoquist on 2/11/13.
//  Copyright (c) 2013 Ivy Gulch, LLC. All rights reserved.
//

#import "NSDictionary+IVGUtils.h"
#import "NSString+IVGUtils.h"

@implementation NSDictionary (IVGUtils)

- (CGRect) CGRectValue;
{
    CGRect r;
    CGRectMakeWithDictionaryRepresentation((__bridge CFDictionaryRef)(self), &r);
    return r;
}

- (id) nilableObjectForKey:(id) key;
{
    id result = [self objectForKey:key];
    if ([result respondsToSelector:@selector(objectForKey:)]) {
        NSString *nilValue = [[result objectForKey:@"_i:nil"] description];
        if ([nilValue xmlBoolValue]) {
            result = nil;
        }
    }
    return result;
}

- (id) nilableObjectMatchingKey:(id) matchingPattern;
{
    NSArray *sortedKeys = [[self allKeys] sortedArrayUsingComparator:^NSComparisonResult(NSString *key1, NSString *key2) {
        return [key1 compare:key2];
    }];
    for (NSString *key in sortedKeys) {
        if ([key matches:matchingPattern]) {
            return [self nilableObjectForKey:key];
        }
    }
    return nil;
}

- (id) anyNilableObject;
{
    id key = [[self allKeys] firstObject];
    return [self nilableObjectForKey:key];
}

+ (NSDictionary *) dictionaryWithCGRect:(CGRect) r;
{
    return [NSDictionary dictionaryWithDictionary:CFBridgingRelease(CGRectCreateDictionaryRepresentation(r))];
}

@end
