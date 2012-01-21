//
//  NSManagedObjectContextIvy Gulch, LLC.m
//  IVGUtils
//
//  Created by Douglas Sjoquist on 3/18/11.
//  Copyright 2011 Ivy Gulch, LLC. All rights reserved.
//

#import "NSManagedObjectContext+IVGUtils.h"

@implementation NSManagedObjectContext (IVGUtils)

- (NSManagedObject *)insertNewEntityWithName:(NSString *)name {
    return [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:self];
}

+ (NSManagedObjectContext *) managedObjectContextForDatastore:(NSURL *) storeUrl error:(NSError **) errorPointer {
    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];    
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    NSPersistentStore *persistentStore = [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:errorPointer];
    if (!persistentStore) {
        return nil;
    }
    
    NSManagedObjectContext *managedObjectContext = [[[NSManagedObjectContext alloc] init] autorelease];
    [managedObjectContext setPersistentStoreCoordinator: persistentStoreCoordinator];
    return managedObjectContext;
}

@end
