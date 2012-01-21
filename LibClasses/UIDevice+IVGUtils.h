//
//  UIDevice+IVGUtils.h
//  IVGUtils
//
//  Created by Douglas Sjoquist on 3/20/11.
//  Copyright 2011 Ivy Gulch, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (IVGUtils)

- (NSString *)machine;
- (BOOL) isLimitedMachine;

+ (BOOL) isRunningOniPad;
+ (BOOL) isPortrait;
+ (BOOL) isLandscape;
+ (UIDeviceOrientation) deviceOrientation;
+ (NSInteger) getSystemVersionAsAnInteger;
+ (BOOL) systemVersionIsAtLeast:(NSInteger) minimumVersion;

@end
