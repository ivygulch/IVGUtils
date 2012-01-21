//
//  UIView+IVGUtils.m
//  IVGUtils
//
//  Created by Douglas Sjoquist on 3/23/11.
//  Copyright 2011 Ivy Gulch, LLC. All rights reserved.
//

#import "UIView+IVGUtils.h"

@implementation UIView(IVGUtils)

- (NSString *) superviewDescription {
    NSString *result = @"";
    NSString *sep = @"";
    UIView *v = self;
    NSString *margin = @"";
    while (v) {
        result = [NSString stringWithFormat:@"%@%@%@%@", result, sep, margin, v];
        v = v.superview;
        margin = [NSString stringWithFormat:@"%@    ", margin];
        sep = @"\n";
    }    
    return result;
}

- (id) findSuperviewIsKindOfClass: (Class) clazz {
    UIView *v = self.superview;
    while (v) {
        if ([v isKindOfClass:clazz]) {
            return v;
        }
        v = v.superview;
    }    
    return nil;
}

- (void) logSizes:(NSString *) desc {
        NSLog(@"%@: f=[%0.1f,%0.1f %0.1f,%0.1f]  b=[%0.1f,%0.1f %0.1f,%0.1f]  c=[%0.1f,%0.1f]", 
              desc, 
              self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height,
              self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height,
              self.center.x, self.center.y
              );
}

- (void) removeAllGestureRecognizers {
    NSArray *recognizers = [NSArray arrayWithArray:self.gestureRecognizers];
    for (UIGestureRecognizer *recognizer in recognizers) {
        [self removeGestureRecognizer:recognizer];
    }
}

+ (void) updateFrame:(UIView *) view x:(CGFloat) x {
    view.frame = (CGRect) {{x, view.frame.origin.y}, view.frame.size};
}

+ (void) updateFrame:(UIView *) view w:(CGFloat) w {
    view.frame = (CGRect) {view.frame.origin, {w, view.frame.size.height}};
}

@end
