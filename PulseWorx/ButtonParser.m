//
//  ButtonParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ButtonParser.h"

typedef enum : uint8_t {
    ButtonChannelNumber = 1,
    ButtonComponentNumber,
    ButtonModuleId,
    ButtonLinkId,
    ButtonSingleClickAction,
    ButtonDoubleClickAction,
    ButtonHoldAction,
    ButtonReleaseAction,
    ButtonSingleClickToggleAction,
    ButtonDoubleClickToggleAction,
    ButtonHoldToggleAction,
    ButtonReleaseToggleAction,
    ButtonIndicatorLinkId,
    ButtonIndicatorByte,
} ButtonRecordType;

@implementation ButtonParser

+ (ButtonEntity *)parseData:(NSArray *)data {
    ButtonEntity *entity = [[ButtonEntity alloc] init];
    
    entity.channelNumber = [[data objectAtIndex:ButtonChannelNumber] intValue];
    entity.componentNumber = [[data objectAtIndex:ButtonComponentNumber] intValue];
    entity.moduleId = [[data objectAtIndex:ButtonModuleId] intValue];
    entity.linkId = [[data objectAtIndex:ButtonLinkId] intValue];
    entity.singleClickAction = [[data objectAtIndex:ButtonSingleClickAction] intValue];
    entity.doubleClickAction = [[data objectAtIndex:ButtonDoubleClickAction] intValue];
    entity.holdAction = [[data objectAtIndex:ButtonHoldAction] intValue];
    entity.releaseAction = [[data objectAtIndex:ButtonReleaseAction] intValue];
    entity.singleClickToggleAction = [[data objectAtIndex:ButtonSingleClickToggleAction] intValue];
    entity.doubleClickToggleAction = [[data objectAtIndex:ButtonDoubleClickToggleAction] intValue];
    entity.holdToggleAction = [[data objectAtIndex:ButtonHoldToggleAction] intValue];
    entity.releaseToggleAction = [[data objectAtIndex:ButtonReleaseToggleAction] intValue];
    entity.indicatorLinkId = [[data objectAtIndex:ButtonIndicatorLinkId] intValue];
    entity.indicatorByte = [[data objectAtIndex:ButtonIndicatorByte] intValue];
    
    entity.entityId = [[data objectAtIndex:ButtonModuleId] intValue];

    return entity;
}

@end
