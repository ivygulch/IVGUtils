//
//  UIView+IVGUtils.h
//  IVGUtils
//
//  Created by Douglas Sjoquist on 3/23/11.
//  Copyright 2011 Ivy Gulch, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(IVGUtils)

- (NSString *) superviewDescription;
- (id) findSuperviewIsKindOfClass: (Class) clazz;
- (void) logSizes:(NSString *) desc;
- (void) removeAllGestureRecognizers;

+ (void) updateFrame:(UIView *) view x:(CGFloat) x;
+ (void) updateFrame:(UIView *) view w:(CGFloat) w;

@end
