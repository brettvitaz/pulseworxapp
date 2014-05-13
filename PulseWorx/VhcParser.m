//
//  VhcParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "VhcParser.h"

typedef enum : uint8_t {
    VhcChannelNumber = 1,
    VhcComponentNumber,
    VhcModuleId,
    VhcTransmitCommand,
} VhcRecordType;

@implementation VhcParser

+ (VhcEntity *)parseData:(NSArray *)data {
    VhcEntity *entity = [[VhcEntity alloc] init];
    
    [entity setChannelNumber:[[data objectAtIndex:VhcChannelNumber] intValue]];
    [entity setComponentNumber:[[data objectAtIndex:VhcComponentNumber] intValue]];
    [entity setModuleId:[[data objectAtIndex:VhcModuleId] intValue]];
    [entity setTransmitCommand:[[data objectAtIndex:VhcTransmitCommand] intValue]];
    
    [entity setEntityId:[[data objectAtIndex:VhcModuleId] intValue]];

    return entity;
}

@end
