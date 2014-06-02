//
//  XpwParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "XpwParser.h"

typedef enum : uint8_t {
    XpwChannelNumber = 1,
    XpwComponentNumber,
    XpwModuleId,
    XpwHousecodeMap,
    XpwCommandMap,
} XpwRecordType;

@implementation XpwParser

+ (XpwEntity *)parseData:(NSArray *)data {
    XpwEntity *entity = [[XpwEntity alloc] init];
    
    entity.channelNumber = [[data objectAtIndex:XpwChannelNumber] intValue];
    entity.componentNumber = [[data objectAtIndex:XpwComponentNumber] intValue];
    entity.moduleId = [[data objectAtIndex:XpwModuleId] intValue];
    entity.housecodeMap = [[data objectAtIndex:XpwHousecodeMap] intValue];
    entity.commandMap = [[data objectAtIndex:XpwCommandMap] intValue];
    
    entity.entityId = [[data objectAtIndex:XpwModuleId] intValue];

    return entity;
}

@end
