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
//        [self setLinkRecords:[[NSMutableArray alloc] init]];
//        [self setModuleRecords:[[NSMutableArray alloc] init]];
//        [self setChannelRecords:[[NSMutableArray alloc] init]];
//        [self setPresetRecords:[[NSMutableArray alloc] init]];
//        [self setRockerRecords:[[NSMutableArray alloc] init]];
//        [self setButtonRecords:[[NSMutableArray alloc] init]];
//        [self setInputRecords:[[NSMutableArray alloc] init]];
//        [self setVhcRecords:[[NSMutableArray alloc] init]];
//        [self setKeypadRecords:[[NSMutableArray alloc] init]];
//        [self setThermostatRecords:[[NSMutableArray alloc] init]];
//        [self setXpwRecords:[[NSMutableArray alloc] init]];
//        [self setRfiRecords:[[NSMutableArray alloc] init]];
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

- (NSArray *)getButtonsForKeypad:(NSNumber *)moduleId {
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    
    for (ButtonEntity *button in [[self buttonRecords] entityList]) {
        if ([moduleId isEqualToNumber:[NSNumber numberWithInteger:[button moduleId]]] && [button linkId] > 0 && [button linkId] < 255) {
            if ([button entityName] == nil) {
                PulseWorxEntity *linkEntity = [[self linkRecords] getEntityForId:[NSNumber numberWithInteger:[button linkId]]];
                [button setEntityName:[linkEntity entityName]];
            }
            [buttons addObject:button];
        }
    }
    
    return buttons;
}

@end
