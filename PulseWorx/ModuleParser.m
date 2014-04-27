//
//  ModuleParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/16/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ModuleParser.h"

typedef NS_ENUM(NSUInteger, ModuleRecordType) {
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
};

@implementation ModuleParser

+ (ModuleEntity *)parseData:(NSArray *)data {
    ModuleEntity *entity = [[ModuleEntity alloc] init];
    
    [entity setModuleId:[[data objectAtIndex:ModuleId] integerValue]];
    [entity setNetworkId:[[data objectAtIndex:ModuleNetId] integerValue]];
    [entity setManufacturerId:[[data objectAtIndex:ModuleManufacturerId] integerValue]];
    [entity setProductId:[[data objectAtIndex:ModuleProductId] integerValue]];
    [entity setFirmwareVersionMajor:[[data objectAtIndex:ModuleFirmwareMajorVersion] integerValue]];
    [entity setFirmwareVersionMinor:[[data objectAtIndex:ModuleFirmwareMinorVersion] integerValue]];
    [entity setKind:[[data objectAtIndex:ModuleKind] integerValue]];
    [entity setNumberOfChannels:[[data objectAtIndex:ModuleNumberOfChannels] integerValue]];
    [entity setNumberOfTransmitComponents:[[data objectAtIndex:ModuleNumberOfTransmitComponents] integerValue]];
    [entity setNumberOfReceiveComponents:[[data objectAtIndex:ModuleNumberOfReceiveComponents] integerValue]];
    [entity setRoomName:[data objectAtIndex:ModuleRoomName]];
    [entity setDeviceName:[data objectAtIndex:ModuleDeviceName]];
    [entity setPacketType:[[data objectAtIndex:ModulePacketType] integerValue]];
    
    return entity;
}

@end
