//
//  NSString+IVGUtils.m
//  IVGUtils
//
//  Created by Douglas Sjoquist on 3/18/11.
//  Copyright 2011 Ivy Gulch, LLC. All rights reserved.
//

#import "NSString+IVGUtils.h"

@implementation NSString(IVGUtils)

+ (NSString *) GUID {
    // create a new UUID which you own
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    
    // create a new CFStringRef (toll-free bridged to NSString)
    // that you own
    NSString *uuidString = (NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
    
    // transfer ownership of the string
    // to the autorelease pool
    [uuidString autorelease];
    
    // release the UUID
    CFRelease(uuid);
    
    return uuidString;
}

- (BOOL) haveValue {
    return [self length] > 0;
}

- (NSString *) trimAllLeading:(NSString *) value;
{
    NSUInteger lenValue = [value length];
    if (lenValue == 0) {
        return self;
    }
    
    NSRange range = (NSRange) {0,lenValue};
    NSMutableString *ms = [NSMutableString stringWithString:self];
    while ([ms hasPrefix:value]) {
        [ms replaceCharactersInRange:range withString:@""];
    }
    return [NSString stringWithString:ms];
}

- (NSString *) trimAllTrailing:(NSString *) value;
{
    NSUInteger lenValue = [value length];
    if (lenValue == 0) {
        return self;
    }
    
    NSMutableString *ms = [NSMutableString stringWithString:self];
    while ([ms hasSuffix:value]) {
        NSRange range = (NSRange) {[ms length]-lenValue,lenValue};
        [ms replaceCharactersInRange:range withString:@""];
    }
    return [NSString stringWithString:ms];
}

- (NSString *) trimMatchingLeadingTrailing:(NSString *) value;
{
    NSUInteger lenValue = [value length];
    if (lenValue == 0) {
        return self;
    }

    if ([self hasSuffix:value] && [self hasPrefix:value]) {
        NSMutableString *ms = [NSMutableString stringWithString:self];
        [ms replaceCharactersInRange:(NSRange) {0,lenValue} withString:@""];
        if ([ms length] > 0) {
            [ms replaceCharactersInRange:(NSRange) {[ms length]-lenValue,lenValue} withString:@""];
        }
        return [NSString stringWithString:ms];
    } else {
        return self;
    }
}

@end
