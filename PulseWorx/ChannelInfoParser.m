//
//  ChannelInfoParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/20/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ChannelInfoParser.h"

typedef enum : uint8_t {
    ChannelNumber = 1,
    ChannelModuleId,
    ChannelDimEnabled,
    ChannelFadeRate,
} ChannelInfoRecordType;

@implementation ChannelInfoParser

+ (ChannelInfoEntity *)parseData:(NSArray *)data {
    ChannelInfoEntity *entity = [[ChannelInfoEntity alloc] init];
    
    [entity setChannelNumber:[[data objectAtIndex:ChannelNumber] intValue]];
    [entity setModuleId:[[data objectAtIndex:ChannelModuleId] intValue]];
    [entity setDimEnabled:[[data objectAtIndex:ChannelDimEnabled] boolValue]];
    [entity setFadeRate:[[data objectAtIndex:ChannelFadeRate] intValue]];
    
    [entity setEntityId:[[data objectAtIndex:ChannelModuleId] intValue]];

    return entity;
}

@end
