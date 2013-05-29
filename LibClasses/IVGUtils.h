//
//  IVGUtils.h
//  IVGUtils
//
//  Created by Douglas Sjoquist on 09/01/11.
//  Copyright 2011 Ivy Gulch, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

NSArray* CGColorArray(NSArray *colors);

@interface IVGUtils : NSObject

+ (NSDateFormatter *) sharedDateFormatter;
+ (NSString *) stringFromDate:(NSDate *) value withFormat:(NSString *) format;
+ (NSDate *) dateFromString:(NSString *) value withFormat:(NSString *) format;

+ (id) ifNil:(id) value use:(id) defaultValue;
+ (BOOL) haveValue:(NSString *) value;

+ (void) showAlertViewTitle:(NSString *) title 
                    message:(NSString *) message 
                   delegate:(id<UIAlertViewDelegate>) delegate
          cancelButtonTitle:(NSString *) cancelButtonTitle;

@end
