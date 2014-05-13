//
//  ThermostatParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ThermostatParser.h"

typedef enum : uint8_t {
    ThermostatChannelNumber = 1,
    ThermostatComponentNumber,
    ThermostatModuleId,
    ThermostatModelVersion1,
    ThermostatModelVersion2,
    ThermostatUnits,
    ThermostatInhibitLink,
    ThermostatLinkBase,
    ThermostatSetpointDelta,
} ThermostatRecordType;

@implementation ThermostatParser

+ (ThermostatEntity *)parseData:(NSArray *)data {
    ThermostatEntity *entity = [[ThermostatEntity alloc] init];
    
    [entity setChannelNumber:[[data objectAtIndex:ThermostatChannelNumber] intValue]];
    [entity setComponentNumber:[[data objectAtIndex:ThermostatComponentNumber] intValue]];
    [entity setModuleId:[[data objectAtIndex:ThermostatModuleId] intValue]];
    [entity setModelVersion1:[[data objectAtIndex:ThermostatModelVersion1] intValue]];
    [entity setModelVersion2:[[data objectAtIndex:ThermostatModelVersion2] intValue]];
    [entity setUnits:[[data objectAtIndex:ThermostatUnits] intValue]];
    [entity setInhibitLink:[[data objectAtIndex:ThermostatInhibitLink] intValue]];
    [entity setLinkBase:[[data objectAtIndex:ThermostatLinkBase] intValue]];
    [entity setSetpointDelta:[[data objectAtIndex:ThermostatSetpointDelta] intValue]];

    [entity setEntityId:[[data objectAtIndex:ThermostatModuleId] intValue]];

    return entity;
}

@end
