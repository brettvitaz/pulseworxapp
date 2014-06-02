//
//  PulseWorxEntitySet.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/27/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntitySet.h"
#import "PulseWorxEntity.h"

@implementation PulseWorxEntitySet

- (void)addObject:(PulseWorxEntity *)entity {
    NSMutableArray *newList = [[NSMutableArray alloc] initWithArray:self.entityList];
    [newList addObject:entity];
    self.entityList = newList;
}

- (NSArray *)getEntitiesForId:(NSNumber *)entityId {
    NSMutableArray *entityList = [[NSMutableArray alloc] init];
    
    for (PulseWorxEntity *entity in self.entityList) {
        if ([entityId isEqualToNumber:[NSNumber numberWithInteger:entity.entityId]]) {
            [entityList addObject:entity];
        }
    }
    
    return entityList;
}

- (PulseWorxEntity *)getEntityForId:(uint8_t)entityId {
    PulseWorxEntity *foundEntity = nil;
    
    for (PulseWorxEntity *entity in self.entityList) {
        if (entityId == entity.entityId) {
            foundEntity = entity;
            break;
        }
    }
    
    return foundEntity;
}

@end
