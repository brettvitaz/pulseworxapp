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
    
    [entity setChannelNumber:[[data objectAtIndex:RockerChannelNumber] intValue]];
    [entity setComponentNumber:[[data objectAtIndex:RockerComponentNumber] intValue]];
    [entity setModuleId:[[data objectAtIndex:RockerModuleId] intValue]];
    [entity setTopRockerLinkId:[[data objectAtIndex:RockerTopRockerLinkId] intValue]];
    [entity setTopRockerSingleClickAction:[[data objectAtIndex:RockerTopRockerSingleClickAction] intValue]];
    [entity setTopRockerDoubleClickAction:[[data objectAtIndex:RockerTopRockerDoubleClickAction] intValue]];
    [entity setTopRockerHoldAction:[[data objectAtIndex:RockerTopRockerHoldAction] intValue]];
    [entity setTopRockerReleaseAction:[[data objectAtIndex:RockerTopRockerReleaseAction] intValue]];
    [entity setBottomRockerLinkId:[[data objectAtIndex:RockerBottomRockerLinkId] intValue]];
    [entity setBottomRockerSingleClickAction:[[data objectAtIndex:RockerBottomRockerSingleClickAction] intValue]];
    [entity setBottomRockerDoubleClickAction:[[data objectAtIndex:RockerBottomRockerDoubleClickAction] intValue]];
    [entity setBottomRockerHoldAction:[[data objectAtIndex:RockerBottomRockerHoldAction] intValue]];
    [entity setBottomRockerReleaseAction:[[data objectAtIndex:RockerBottomRockerReleaseAction] intValue]];
    
    [entity setEntityId:[[data objectAtIndex:RockerModuleId] intValue]];

    return entity;
}

@end
