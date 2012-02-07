//
//  IVGBlockMap.m
//  WAI2012
//
//  Created by Sjoquist Douglas on 2/1/12.
//  Copyright (c) 2012 Ivy Gulch, LLC. All rights reserved.
//

#import "IVGBlockMap.h"

@interface IVGBlockMap()

@property (retain) NSMutableDictionary *blockMap;
// allow map to handle nil block values by substituting a simple object
// for the block reference (value) in the map. NULL_BLOCK is that shared object.
@property (retain) id NULL_BLOCK; 

@end

@implementation IVGBlockMap

@synthesize blockMap = blockMap_;
@synthesize NULL_BLOCK = NULL_BLOCK_;

- (id) init;
{
    if ((self = [super init])) {
        blockMap_ = [[NSMutableDictionary alloc] init];
        NULL_BLOCK_ = [[NSObject alloc] init];
    }
    return self;
}

- (void) dealloc;
{
    // do a block release on any remaining blocks in the map
    for (id key in [blockMap_ keyEnumerator]) {
        id blockRef = [blockMap_ objectForKey:key];
        if (blockRef != NULL_BLOCK_) {
            id block = [blockRef pointerValue];
            Block_release(block);
        }
    }
    [blockMap_ release], blockMap_ = nil;
    [NULL_BLOCK_ release], NULL_BLOCK_ = nil;

    [super dealloc];
}

- (void) setBlock:(id) block forKey:(id) key;
{
    [self removeBlockForKey:key]; // remove any existing block so the copy gets released properly
    
    id blockRef;
    if(block == nil){ 
        blockRef = self.NULL_BLOCK;
    } else { 
        blockRef = Block_copy(block);
    }
    [self.blockMap setObject:blockRef forKey:key];
}

- (void) removeBlockForKey:(id) key;
{
    id block = [self blockForKey:key];
    if (block != nil) {
        Block_release(block);
    }
}

- (id) blockForKey:(id) key;
{
    id blockRef = [self.blockMap objectForKey:key];
    if (blockRef == self.NULL_BLOCK) {
        return nil;
    } else {
        return blockRef;
    }
}

- (NSArray *) allKeys;
{
    return [self.blockMap allKeys];
}

- (void)enumerateKeysAndBlocksUsingBlock:(void (^)(id key, id block, BOOL *stop))enumerationBlock;
{
    BOOL stopEnumeration = NO;
    for (id key in [self allKeys]) {
        id block = [self blockForKey:key];
        enumerationBlock(key, block, &stopEnumeration);
        if (stopEnumeration) {
            break;
        }
    }
}

@end
