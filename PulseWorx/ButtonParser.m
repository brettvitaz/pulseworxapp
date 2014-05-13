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
    
    [entity setChannelNumber:[[data objectAtIndex:ButtonChannelNumber] intValue]];
    [entity setComponentNumber:[[data objectAtIndex:ButtonComponentNumber] intValue]];
    [entity setModuleId:[[data objectAtIndex:ButtonModuleId] intValue]];
    [entity setLinkId:[[data objectAtIndex:ButtonLinkId] intValue]];
    [entity setSingleClickAction:[[data objectAtIndex:ButtonSingleClickAction] intValue]];
    [entity setDoubleClickAction:[[data objectAtIndex:ButtonDoubleClickAction] intValue]];
    [entity setHoldAction:[[data objectAtIndex:ButtonHoldAction] intValue]];
    [entity setReleaseAction:[[data objectAtIndex:ButtonReleaseAction] intValue]];
    [entity setSingleClickToggleAction:[[data objectAtIndex:ButtonSingleClickToggleAction] intValue]];
    [entity setDoubleClickToggleAction:[[data objectAtIndex:ButtonDoubleClickToggleAction] intValue]];
    [entity setHoldToggleAction:[[data objectAtIndex:ButtonHoldToggleAction] intValue]];
    [entity setReleaseToggleAction:[[data objectAtIndex:ButtonReleaseToggleAction] intValue]];
    [entity setIndicatorLinkId:[[data objectAtIndex:ButtonIndicatorLinkId] intValue]];
    [entity setIndicatorByte:[[data objectAtIndex:ButtonIndicatorByte] intValue]];
    
    [entity setEntityId:[[data objectAtIndex:ButtonModuleId] intValue]];

    return entity;
}

@end
