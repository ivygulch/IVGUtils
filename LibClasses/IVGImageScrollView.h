//
//  IVGImageScrollView.h
//  IVGUtils
//
//  Created by Douglas Sjoquist on 6/12/11.
//  Copyright 2011 Ivy Gulch, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kIVGImageScrollView_TapZoomStep 1.5f

@interface IVGImageScrollView : UIScrollView <UIScrollViewDelegate> {
    UIImageView        *imageView;
    NSUInteger     index;
    id<UIScrollViewDelegate> secondaryDelegate_;
    BOOL automaticMaximumScale_;
}

@property (assign) NSUInteger index;
@property (nonatomic, assign, getter=isAutomaticMaximumScale) BOOL automaticMaximumScale;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, assign) IBOutlet id<UIScrollViewDelegate> secondaryDelegate;

- (void)setMaxMinZoomScalesForCurrentBounds;

- (CGPoint)pointToCenterAfterRotation;
- (CGFloat)scaleToRestoreAfterRotation;
- (void)restoreCenterPoint:(CGPoint)oldCenter scale:(CGFloat)oldScale;

@end
