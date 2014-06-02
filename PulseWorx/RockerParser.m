//
//  RockerParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "RockerParser.h"

typedef enum : uint8_t {
    RockerChannelNumber = 1,
    RockerComponentNumber,
    RockerModuleId,
    RockerTopRockerLinkId,
    RockerTopRockerSingleClickAction,
    RockerTopRockerDoubleClickAction,
    RockerTopRockerHoldAction,
    RockerTopRockerReleaseAction,
    RockerBottomRockerLinkId,
    RockerBottomRockerSingleClickAction,
    RockerBottomRockerDoubleClickAction,
    RockerBottomRockerHoldAction,
    RockerBottomRockerReleaseAction,
} RockerRecordType;

@implementation RockerParser

+ (RockerEntity *)parseData:(NSArray *)data {
    RockerEntity *entity = [[RockerEntity alloc] init];
    
    entity.channelNumber = [[data objectAtIndex:RockerChannelNumber] intValue];
    entity.componentNumber = [[data objectAtIndex:RockerComponentNumber] intValue];
    entity.moduleId = [[data objectAtIndex:RockerModuleId] intValue];
    entity.topRockerLinkId = [[data objectAtIndex:RockerTopRockerLinkId] intValue];
    entity.topRockerSingleClickAction = [[data objectAtIndex:RockerTopRockerSingleClickAction] intValue];
    entity.topRockerDoubleClickAction = [[data objectAtIndex:RockerTopRockerDoubleClickAction] intValue];
    entity.topRockerHoldAction = [[data objectAtIndex:RockerTopRockerHoldAction] intValue];
    entity.topRockerReleaseAction = [[data objectAtIndex:RockerTopRockerReleaseAction] intValue];
    entity.bottomRockerLinkId = [[data objectAtIndex:RockerBottomRockerLinkId] intValue];
    entity.bottomRockerSingleClickAction = [[data objectAtIndex:RockerBottomRockerSingleClickAction] intValue];
    entity.bottomRockerDoubleClickAction = [[data objectAtIndex:RockerBottomRockerDoubleClickAction] intValue];
    entity.bottomRockerHoldAction = [[data objectAtIndex:RockerBottomRockerHoldAction] intValue];
    entity.bottomRockerReleaseAction = [[data objectAtIndex:RockerBottomRockerReleaseAction] intValue];
    
    entity.entityId = [[data objectAtIndex:RockerModuleId] intValue];

    return entity;
}

@end
