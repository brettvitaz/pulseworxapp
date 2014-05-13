//
//  PulseWorxSystem.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/13/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxSystem.h"
#import "FileRecordEntity.h"
#import "LinkEntity.h"
#import "ModuleEntity.h"
#import "ChannelInfoEntity.h"
#import "PresetEntity.h"
#import "RockerEntity.h"
#import "ButtonEntity.h"
#import "InputEntity.h"
#import "VhcEntity.h"
#import "KeypadEntity.h"
#import "ThermostatEntity.h"
#import "XpwEntity.h"
#import "RfiEntity.h"
#import "PulseWorxEntitySet.h"

@implementation PulseWorxSystem

- (id)init {
    if (self = [super init]) {
        [self setLinkRecords:[[PulseWorxEntitySet alloc] init]];
        [self setModuleRecords:[[PulseWorxEntitySet alloc] init]];
        [self setChannelRecords:[[PulseWorxEntitySet alloc] init]];
        [self setPresetRecords:[[PulseWorxEntitySet alloc] init]];
        [self setRockerRecords:[[PulseWorxEntitySet alloc] init]];
        [self setButtonRecords:[[PulseWorxEntitySet alloc] init]];
        [self setInputRecords:[[PulseWorxEntitySet alloc] init]];
        [self setVhcRecords:[[PulseWorxEntitySet alloc] init]];
        [self setKeypadRecords:[[PulseWorxEntitySet alloc] init]];
        [self setThermostatRecords:[[PulseWorxEntitySet alloc] init]];
        [self setXpwRecords:[[PulseWorxEntitySet alloc] init]];
        [self setRfiRecords:[[PulseWorxEntitySet alloc] init]];
    }
    return self;
}

- (NSArray *)getRoomNames {
    NSMutableSet *roomNames = [[NSMutableSet alloc] init];
    
    for (ModuleEntity *module in [[self moduleRecords] entityList]) {
        [roomNames addObject:[module roomName]];
    }
    return [roomNames allObjects];
}

//- (NSDictionary *)getDevicesForRoom:(NSString *)roomName {
//    NSMutableDictionary * devices = [[NSMutableDictionary alloc] init];
//    
//    for (ModuleEntity *module in [self moduleRecords]) {
//        if ([roomName isEqualToString:[module roomName]]) {
//            [devices setObject:[module deviceName] forKey:[NSNumber numberWithInteger:[module moduleId]]];
//        }
//    }
//    return devices;
//}

- (NSArray *)getDevicesForRoom:(NSString *)roomName {
    NSMutableArray *devices = [[NSMutableArray alloc] init];
    
    for (ModuleEntity *module in [[self moduleRecords] entityList]) {
        if ([roomName isEqualToString:[module roomName]]) {
            [devices addObject:module];
        }
    }
    
    return devices;
}

- (NSArray *)getButtonsForKeypad:(uint8_t)moduleId {
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    
    for (ButtonEntity *button in [[self buttonRecords] entityList]) {
        if (moduleId == [button moduleId] && [button linkId] > 0) {
            [buttons addObject:button];
        }
    }
    
    return buttons;
}

- (NSArray *)getChannelsForDevice:(uint8_t)moduleId {
    NSMutableArray *channels = [[NSMutableArray alloc] init];
    
    for (ChannelInfoEntity *channel in [[self channelRecords] entityList]) {
        if (moduleId == [channel moduleId]) {
            [channels addObject:channel];
        }
    }
    
    return channels;
}

- (void)completeImport {
    for (ButtonEntity *button in [[self buttonRecords] entityList]) {
        if ([button entityName] == nil && [button linkId] > 0) {
            PulseWorxEntity *linkEntity = [[self linkRecords] getEntityForId:[button linkId]];
            [button setEntityName:[linkEntity entityName]];
        }
    }
    for (ChannelInfoEntity *channel in [[self channelRecords] entityList]) {
        if ([channel entityName] == nil) {
            PulseWorxEntity *linkEntity = [[self moduleRecords] getEntityForId:[channel moduleId]];
            [channel setEntityName:[NSString stringWithFormat:@"%@ Channel %d",[linkEntity entityName], [channel channelNumber] + 1]];
        }
    }
}

@end
