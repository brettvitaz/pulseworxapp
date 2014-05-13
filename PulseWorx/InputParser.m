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
    
    [entity setChannelNumber:[[data objectAtIndex:InputChannelNumber] intValue]];
    [entity setComponentNumber:[[data objectAtIndex:InputComponentNumber] intValue]];
    [entity setModuleId:[[data objectAtIndex:InputModuleId] intValue]];
    [entity setOpenLinkId:[[data objectAtIndex:InputOpenLinkId] intValue]];
    [entity setOpenCommandId:[[data objectAtIndex:InputOpenCommandId] intValue]];
    [entity setOpenToggleCommandId:[[data objectAtIndex:InputOpenToggleCommandId] intValue]];
    [entity setCloseLinkId:[[data objectAtIndex:InputCloseLinkId] intValue]];
    [entity setCloseCommandId:[[data objectAtIndex:InputCloseCommandId] intValue]];
    [entity setCloseToggleCommandId:[[data objectAtIndex:InputCloseToggleCommandId] intValue]];
    
    [entity setEntityId:[[data objectAtIndex:InputModuleId] intValue]];

    return entity;
}

@end
