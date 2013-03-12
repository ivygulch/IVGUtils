//
//  UIImage+IVGUtils.m
//  IVGUtils
//
//  Created by Douglas Sjoquist on 3/12/13.
//  Copyright (c) 2013 Ivy Gulch, LLC. All rights reserved.
//

#import "UIImage+IVGUtils.h"

@implementation UIImage (IVGUtils)

+ (UIImage *) imageNamed:(NSString *)name inDirectory:(NSString *) directory;
{
    return [UIImage imageWithContentsOfFile:[directory stringByAppendingPathComponent:name]];
}

@end
