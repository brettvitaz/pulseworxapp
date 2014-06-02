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
    
    entity.channelNumber = [[data objectAtIndex:ThermostatChannelNumber] intValue];
    entity.componentNumber = [[data objectAtIndex:ThermostatComponentNumber] intValue];
    entity.moduleId = [[data objectAtIndex:ThermostatModuleId] intValue];
    entity.modelVersion1 = [[data objectAtIndex:ThermostatModelVersion1] intValue];
    entity.modelVersion2 = [[data objectAtIndex:ThermostatModelVersion2] intValue];
    entity.units = [[data objectAtIndex:ThermostatUnits] intValue];
    entity.inhibitLink = [[data objectAtIndex:ThermostatInhibitLink] intValue];
    entity.linkBase = [[data objectAtIndex:ThermostatLinkBase] intValue];
    entity.setpointDelta = [[data objectAtIndex:ThermostatSetpointDelta] intValue];

    entity.entityId = [[data objectAtIndex:ThermostatModuleId] intValue];

    return entity;
}

@end
