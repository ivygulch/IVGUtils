//
//  IVGTypeMap.h
//  IVGUtils
//
//  Created by Douglas Sjoquist on 2/8/13.
//  Copyright (c) 2013 Ivy Gulch, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IVGTypeMap : NSObject

- (id) initWithDictionary:(NSDictionary *) dictionary;

- (NSInteger) typeForDescription:(NSString *) description;
- (NSString *) descriptionForType:(NSInteger) type;

@end
