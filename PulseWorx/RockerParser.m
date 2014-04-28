//
//  RockerParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "RockerParser.h"

typedef NS_ENUM(NSUInteger, RockerRecordType) {
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
};

@implementation RockerParser

+ (RockerEntity *)parseData:(NSArray *)data {
    RockerEntity *entity = [[RockerEntity alloc] init];
    
    [entity setChannelNumber:[[data objectAtIndex:RockerChannelNumber] integerValue]];
    [entity setComponentNumber:[[data objectAtIndex:RockerComponentNumber] integerValue]];
    [entity setModuleId:[[data objectAtIndex:RockerModuleId] integerValue]];
    [entity setTopRockerLinkId:[[data objectAtIndex:RockerTopRockerLinkId] integerValue]];
    [entity setTopRockerSingleClickAction:[[data objectAtIndex:RockerTopRockerSingleClickAction] integerValue]];
    [entity setTopRockerDoubleClickAction:[[data objectAtIndex:RockerTopRockerDoubleClickAction] integerValue]];
    [entity setTopRockerHoldAction:[[data objectAtIndex:RockerTopRockerHoldAction] integerValue]];
    [entity setTopRockerReleaseAction:[[data objectAtIndex:RockerTopRockerReleaseAction] integerValue]];
    [entity setBottomRockerLinkId:[[data objectAtIndex:RockerBottomRockerLinkId] integerValue]];
    [entity setBottomRockerSingleClickAction:[[data objectAtIndex:RockerBottomRockerSingleClickAction] integerValue]];
    [entity setBottomRockerDoubleClickAction:[[data objectAtIndex:RockerBottomRockerDoubleClickAction] integerValue]];
    [entity setBottomRockerHoldAction:[[data objectAtIndex:RockerBottomRockerHoldAction] integerValue]];
    [entity setBottomRockerReleaseAction:[[data objectAtIndex:RockerBottomRockerReleaseAction] integerValue]];
    
    [entity setEntityId:[[data objectAtIndex:RockerModuleId] integerValue]];

    return entity;
}

@end
