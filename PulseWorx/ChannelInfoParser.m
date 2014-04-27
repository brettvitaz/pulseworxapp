//
//  ChannelInfoParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/20/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ChannelInfoParser.h"

typedef NS_ENUM(NSUInteger, ChannelInfoRecordType) {
    ChannelNumber,
    ChannelModuleId,
    ChannelDimEnabled,
    ChannelFadeRate,
};

@implementation ChannelInfoParser

+ (ChannelInfoEntity *)parseData:(NSArray *)data {
    ChannelInfoEntity *entity = [[ChannelInfoEntity alloc] init];
    
    [entity setChannelNumber:[[data objectAtIndex:ChannelNumber] integerValue]];
    [entity setModuleId:[[data objectAtIndex:ChannelModuleId] integerValue]];
    [entity setDimEnabled:[[data objectAtIndex:ChannelDimEnabled] boolValue]];
    [entity setFadeRate:[[data objectAtIndex:ChannelFadeRate] integerValue]];
    
    return entity;
}

@end
