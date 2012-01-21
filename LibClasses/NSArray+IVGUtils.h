//
//  NSArray+IVGUtils.h
//  IVGUtils
//
//  Created by Douglas Sjoquist on 3/19/11.
//  Copyright 2011 Ivy Gulch, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (IVGUtils)

- (NSArray *) randomized;
- (NSArray *) reversedArray;

+ (NSArray *) sortDescriptors:(NSString *)firstKey, ... NS_REQUIRES_NIL_TERMINATION;

@end
