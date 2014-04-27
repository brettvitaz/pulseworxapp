//
//  InputParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "InputParser.h"

typedef NS_ENUM(NSUInteger, InputRecordType) {
    InputChannelNumber = 1,
    InputComponentNumber,
    InputModuleId,
    InputOpenLinkId,
    InputOpenCommandId,
    InputOpenToggleCommandId,
    InputCloseLinkId,
    InputCloseCommandId,
    InputCloseToggleCommandId,
};

@implementation InputParser

+ (InputEntity *)parseData:(NSArray *)data {
    InputEntity *entity = [[InputEntity alloc] init];
    
    [entity setChannelNumber:[[data objectAtIndex:InputChannelNumber] integerValue]];
    [entity setComponentNumber:[[data objectAtIndex:InputComponentNumber] integerValue]];
    [entity setModuleId:[[data objectAtIndex:InputModuleId] integerValue]];
    [entity setOpenLinkId:[[data objectAtIndex:InputOpenLinkId] integerValue]];
    [entity setOpenCommandId:[[data objectAtIndex:InputOpenCommandId] integerValue]];
    [entity setOpenToggleCommandId:[[data objectAtIndex:InputOpenToggleCommandId] integerValue]];
    [entity setCloseLinkId:[[data objectAtIndex:InputCloseLinkId] integerValue]];
    [entity setCloseCommandId:[[data objectAtIndex:InputCloseCommandId] integerValue]];
    [entity setCloseToggleCommandId:[[data objectAtIndex:InputCloseToggleCommandId] integerValue]];
    
    return entity;
}

@end
