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
    
    [entity setChannelNumber:[[data objectAtIndex:XpwChannelNumber] intValue]];
    [entity setComponentNumber:[[data objectAtIndex:XpwComponentNumber] intValue]];
    [entity setModuleId:[[data objectAtIndex:XpwModuleId] intValue]];
    [entity setHousecodeMap:[[data objectAtIndex:XpwHousecodeMap] intValue]];
    [entity setCommandMap:[[data objectAtIndex:XpwCommandMap] intValue]];
    
    [entity setEntityId:[[data objectAtIndex:XpwModuleId] intValue]];

    return entity;
}

@end
