//
//  IVGCoreDataUtils.h
//  SportysTestBank
//
//  Created by Douglas Sjoquist on 3/21/11.
//  Copyright 2011 Ivy Gulch, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface IVGCoreDataUtils : NSObject {
    
}

+ (NSManagedObjectContext *) managedObjectContextForDatastore:(NSURL *) storeUrl error:(NSError **) errorPointer;

@end
