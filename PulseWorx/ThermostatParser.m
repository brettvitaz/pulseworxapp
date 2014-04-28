//
//  ThermostatParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ThermostatParser.h"

typedef NS_ENUM(NSUInteger, ThermostatRecordType) {
    ThermostatChannelNumber = 1,
    ThermostatComponentNumber,
    ThermostatModuleId,
    ThermostatModelVersion1,
    ThermostatModelVersion2,
    ThermostatUnits,
    ThermostatInhibitLink,
    ThermostatLinkBase,
    ThermostatSetpointDelta,
};

@implementation ThermostatParser

+ (ThermostatEntity *)parseData:(NSArray *)data {
    ThermostatEntity *entity = [[ThermostatEntity alloc] init];
    
    [entity setChannelNumber:[[data objectAtIndex:ThermostatChannelNumber] integerValue]];
    [entity setComponentNumber:[[data objectAtIndex:ThermostatComponentNumber] integerValue]];
    [entity setModuleId:[[data objectAtIndex:ThermostatModuleId] integerValue]];
    [entity setModelVersion1:[[data objectAtIndex:ThermostatModelVersion1] integerValue]];
    [entity setModelVersion2:[[data objectAtIndex:ThermostatModelVersion2] integerValue]];
    [entity setUnits:[[data objectAtIndex:ThermostatUnits] integerValue]];
    [entity setInhibitLink:[[data objectAtIndex:ThermostatInhibitLink] integerValue]];
    [entity setLinkBase:[[data objectAtIndex:ThermostatLinkBase] integerValue]];
    [entity setSetpointDelta:[[data objectAtIndex:ThermostatSetpointDelta] integerValue]];

    [entity setEntityId:[[data objectAtIndex:ThermostatModuleId] integerValue]];

    return entity;
}

@end
