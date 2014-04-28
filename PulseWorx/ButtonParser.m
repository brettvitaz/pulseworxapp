//
//  ButtonParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ButtonParser.h"

typedef NS_ENUM(NSUInteger, ButtonRecordType) {
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
};

@implementation ButtonParser

+ (ButtonEntity *)parseData:(NSArray *)data {
    ButtonEntity *entity = [[ButtonEntity alloc] init];
    
    [entity setChannelNumber:[[data objectAtIndex:ButtonChannelNumber] integerValue]];
    [entity setComponentNumber:[[data objectAtIndex:ButtonComponentNumber] integerValue]];
    [entity setModuleId:[[data objectAtIndex:ButtonModuleId] integerValue]];
    [entity setLinkId:[[data objectAtIndex:ButtonLinkId] integerValue]];
    [entity setSingleClickAction:[[data objectAtIndex:ButtonSingleClickAction] integerValue]];
    [entity setDoubleClickAction:[[data objectAtIndex:ButtonDoubleClickAction] integerValue]];
    [entity setHoldAction:[[data objectAtIndex:ButtonHoldAction] integerValue]];
    [entity setReleaseAction:[[data objectAtIndex:ButtonReleaseAction] integerValue]];
    [entity setSingleClickToggleAction:[[data objectAtIndex:ButtonSingleClickToggleAction] integerValue]];
    [entity setDoubleClickToggleAction:[[data objectAtIndex:ButtonDoubleClickToggleAction] integerValue]];
    [entity setHoldToggleAction:[[data objectAtIndex:ButtonHoldToggleAction] integerValue]];
    [entity setReleaseToggleAction:[[data objectAtIndex:ButtonReleaseToggleAction] integerValue]];
    [entity setIndicatorLinkId:[[data objectAtIndex:ButtonIndicatorLinkId] integerValue]];
    [entity setIndicatorByte:[[data objectAtIndex:ButtonIndicatorByte] integerValue]];
    
    [entity setEntityId:[[data objectAtIndex:ButtonModuleId] integerValue]];

    return entity;
}

@end
