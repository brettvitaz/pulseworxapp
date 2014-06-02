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
    
    entity.moduleId = [[data objectAtIndex:ModuleId] intValue];
    entity.networkId = [[data objectAtIndex:ModuleNetId] intValue];
    entity.manufacturerId = [[data objectAtIndex:ModuleManufacturerId] intValue];
    entity.productId = [[data objectAtIndex:ModuleProductId] intValue];
    entity.firmwareVersionMajor = [[data objectAtIndex:ModuleFirmwareMajorVersion] intValue];
    entity.firmwareVersionMinor = [[data objectAtIndex:ModuleFirmwareMinorVersion] intValue];
    entity.kind = [[data objectAtIndex:ModuleKind] intValue];
    entity.numberOfChannels = [[data objectAtIndex:ModuleNumberOfChannels] intValue];
    entity.numberOfTransmitComponents = [[data objectAtIndex:ModuleNumberOfTransmitComponents] intValue];
    entity.numberOfReceiveComponents = [[data objectAtIndex:ModuleNumberOfReceiveComponents] intValue];
    entity.roomName = [data objectAtIndex:ModuleRoomName];
    entity.deviceName = [data objectAtIndex:ModuleDeviceName];
    entity.packetType = [[data objectAtIndex:ModulePacketType] intValue];
    
    entity.entityId = [[data objectAtIndex:ModuleId] intValue];
    entity.entityName = [data objectAtIndex:ModuleDeviceName];

    return entity;
}

@end
