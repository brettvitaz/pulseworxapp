//
//  XpwParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "XpwParser.h"

typedef NS_ENUM(NSUInteger, XpwRecordType) {
    XpwChannelNumber = 1,
    XpwComponentNumber,
    XpwModuleId,
    XpwHousecodeMap,
    XpwCommandMap,
};

@implementation XpwParser

+ (XpwEntity *)parseData:(NSArray *)data {
    XpwEntity *entity = [[XpwEntity alloc] init];
    
    [entity setChannelNumber:[[data objectAtIndex:XpwChannelNumber] integerValue]];
    [entity setComponentNumber:[[data objectAtIndex:XpwComponentNumber] integerValue]];
    [entity setModuleId:[[data objectAtIndex:XpwModuleId] integerValue]];
    [entity setHousecodeMap:[[data objectAtIndex:XpwHousecodeMap] integerValue]];
    [entity setCommandMap:[[data objectAtIndex:XpwCommandMap] integerValue]];
    
    [entity setEntityId:[[data objectAtIndex:XpwModuleId] integerValue]];

    return entity;
}

@end
