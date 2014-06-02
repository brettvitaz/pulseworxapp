//
//  InputParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "InputParser.h"

typedef enum : uint8_t {
    InputChannelNumber = 1,
    InputComponentNumber,
    InputModuleId,
    InputOpenLinkId,
    InputOpenCommandId,
    InputOpenToggleCommandId,
    InputCloseLinkId,
    InputCloseCommandId,
    InputCloseToggleCommandId,
} InputRecordType;

@implementation InputParser

+ (InputEntity *)parseData:(NSArray *)data {
    InputEntity *entity = [[InputEntity alloc] init];
    
    entity.channelNumber = [[data objectAtIndex:InputChannelNumber] intValue];
    entity.componentNumber = [[data objectAtIndex:InputComponentNumber] intValue];
    entity.moduleId = [[data objectAtIndex:InputModuleId] intValue];
    entity.openLinkId = [[data objectAtIndex:InputOpenLinkId] intValue];
    entity.openCommandId = [[data objectAtIndex:InputOpenCommandId] intValue];
    entity.openToggleCommandId = [[data objectAtIndex:InputOpenToggleCommandId] intValue];
    entity.closeLinkId = [[data objectAtIndex:InputCloseLinkId] intValue];
    entity.closeCommandId = [[data objectAtIndex:InputCloseCommandId] intValue];
    entity.closeToggleCommandId = [[data objectAtIndex:InputCloseToggleCommandId] intValue];
    
    entity.entityId = [[data objectAtIndex:InputModuleId] intValue];

    return entity;
}

@end
