//
//  NSFileManager+IVGUtils.m
//  Pods
//
//  Created by Douglas Sjoquist on 3/12/13.
//
//

#import "NSFileManager+IVGUtils.h"

@implementation NSFileManager (IVGUtils)

- (NSDate *) timestampForFilePath:(NSString *) filePath error:(NSError **) error;
{
    if ((filePath == nil) || ![self fileExistsAtPath:filePath]) {
        if (error != nil) {
            *error = [NSError errorWithDomain:@"NSFileManager+IVGUtils" code:1 userInfo:@{@"filePath":(filePath == nil) ? [NSNull null]: filePath}];
        }
        return nil;
    }

    NSDictionary *fileAttributes = [self attributesOfItemAtPath:filePath error:error];
    if (fileAttributes == nil) {
        return nil;
    } else {
        return [fileAttributes objectForKey:NSFileModificationDate];
    }
}

- (BOOL) setTimestamp:(NSDate *) timestamp forFilePath:(NSString *) filePath error:(NSError **) error;
{
    if ((filePath == nil) || ![self fileExistsAtPath:filePath]) {
        if (error != nil) {
            *error = [NSError errorWithDomain:@"NSFileManager+IVGUtils" code:1 userInfo:@{@"filePath":(filePath == nil) ? [NSNull null]: filePath}];
        }
        return NO;
    }

    NSDictionary *updatedAttributes = @{NSFileModificationDate:timestamp};
    return [self setAttributes:updatedAttributes ofItemAtPath:filePath error:error];
}

- (BOOL) resetTimestampForFilePath:(NSString *) filePath error:(NSError **) error;
{
    return [self setTimestamp:[NSDate distantPast] forFilePath:filePath error:error];
}

@end
