//
//  PulseWorxEntitySet.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/27/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PulseWorxEntity;

@protocol PulseWorxEntitySet <NSObject>

- (NSArray *)getEntitiesForId:(NSNumber *)entityId;

@optional

- (NSArray *)getEntitiesForName:(NSString *)entityName;

@end

@interface PulseWorxEntitySet : NSObject <PulseWorxEntitySet>

@property (nonatomic) NSArray *entityList;

- (void)addObject:(PulseWorxEntity *)entity;
- (PulseWorxEntity *)getEntityForId:(uint8_t)entityId;

@end

