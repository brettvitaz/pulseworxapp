//
//  ModuleParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/16/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ModuleParser.h"

typedef enum : uint8_t {
    ModuleId = 1,
    ModuleNetId,
    ModuleManufacturerId,
    ModuleProductId,
    ModuleFirmwareMajorVersion,
    ModuleFirmwareMinorVersion,
    ModuleKind,
    ModuleNumberOfChannels,
    ModuleNumberOfTransmitComponents,
    ModuleNumberOfReceiveComponents,
    ModuleRoomName,
    ModuleDeviceName,
    ModulePacketType,
} ModuleRecordType;

@implementation ModuleParser

+ (ModuleEntity *)parseData:(NSArray *)data {
    ModuleEntity *entity = [[ModuleEntity alloc] init];
    
    [entity setModuleId:[[data objectAtIndex:ModuleId] intValue]];
    [entity setNetworkId:[[data objectAtIndex:ModuleNetId] intValue]];
    [entity setManufacturerId:[[data objectAtIndex:ModuleManufacturerId] intValue]];
    [entity setProductId:[[data objectAtIndex:ModuleProductId] intValue]];
    [entity setFirmwareVersionMajor:[[data objectAtIndex:ModuleFirmwareMajorVersion] intValue]];
    [entity setFirmwareVersionMinor:[[data objectAtIndex:ModuleFirmwareMinorVersion] intValue]];
    [entity setKind:[[data objectAtIndex:ModuleKind] intValue]];
    [entity setNumberOfChannels:[[data objectAtIndex:ModuleNumberOfChannels] intValue]];
    [entity setNumberOfTransmitComponents:[[data objectAtIndex:ModuleNumberOfTransmitComponents] intValue]];
    [entity setNumberOfReceiveComponents:[[data objectAtIndex:ModuleNumberOfReceiveComponents] intValue]];
    [entity setRoomName:[data objectAtIndex:ModuleRoomName]];
    [entity setDeviceName:[data objectAtIndex:ModuleDeviceName]];
    [entity setPacketType:[[data objectAtIndex:ModulePacketType] intValue]];
    
    [entity setEntityId:[[data objectAtIndex:ModuleId] intValue]];
    [entity setEntityName:[data objectAtIndex:ModuleDeviceName]];

    return entity;
}

@end
