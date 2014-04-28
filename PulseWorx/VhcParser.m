//
//  VhcParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "VhcParser.h"

typedef NS_ENUM(NSUInteger, VhcRecordType) {
    VhcChannelNumber = 1,
    VhcComponentNumber,
    VhcModuleId,
    VhcTransmitCommand,
};

@implementation VhcParser

+ (VhcEntity *)parseData:(NSArray *)data {
    VhcEntity *entity = [[VhcEntity alloc] init];
    
    [entity setChannelNumber:[[data objectAtIndex:VhcChannelNumber] integerValue]];
    [entity setComponentNumber:[[data objectAtIndex:VhcComponentNumber] integerValue]];
    [entity setModuleId:[[data objectAtIndex:VhcModuleId] integerValue]];
    [entity setTransmitCommand:[[data objectAtIndex:VhcTransmitCommand] integerValue]];
    
    [entity setEntityId:[[data objectAtIndex:VhcModuleId] integerValue]];

    return entity;
}

@end
