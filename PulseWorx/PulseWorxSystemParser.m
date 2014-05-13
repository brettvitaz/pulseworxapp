//
//  PulseWorxSystemParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/14/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxSystemParser.h"
#import "PulseWorxSystem.h"
#import "FileRecordParser.h"
#import "LinkParser.h"
#import "ModuleParser.h"
#import "ChannelInfoParser.h"
#import "PresetParser.h"
#import "RockerParser.h"
#import "ButtonParser.h"
#import "InputParser.h"
#import "VhcParser.h"
#import "KeypadParser.h"
#import "ThermostatParser.h"
#import "XpwParser.h"
#import "RfiParser.h"
#import "PulseWorxEntitySet.h"

typedef enum : uint8_t {
    SystemBegin = 0,
    SystemEnd,
    SystemLink,
    SystemModule,
    SystemPreset,
    SystemRocker,
    SystemButton,
    SystemInput,
    SystemChannelInfo,
    SystemVhc,
    SystemInstallerInfo,
    SystemOwnerInfo,
    SystemDeviceMemory,
    SystemKeypadIndicator,
    SystemThermostat,
    SystemXpw,
    SystemRfi,
} SystemRecordType;

@implementation PulseWorxSystemParser

- (id)initWithData:(NSArray *)data {
    if (self = [super init]) {
        [PulseWorxSystemParser parseData:data];
    }
    return self;
}

+ (PulseWorxSystem *)parseData:(NSArray *)data {
    PulseWorxSystem *system = [[PulseWorxSystem alloc] init];

    for (NSUInteger i = 0; i < [data count]; i++) {
        NSArray *recordData = [data objectAtIndex:i];
        
        switch ([[recordData objectAtIndex:0] intValue]) {
            case SystemBegin:
                [system setFileRecord:[FileRecordParser parseData:recordData]];
                break;
            case SystemEnd:
                break;
            case SystemLink:
                [[system linkRecords] addObject:[LinkParser parseData:recordData]];
                break;
            case SystemModule:
                [[system moduleRecords] addObject:[ModuleParser parseData:recordData]];
                break;
            case SystemChannelInfo:
                [[system channelRecords] addObject:[ChannelInfoParser parseData:recordData]];
                break;
            case SystemPreset:
                [[system presetRecords] addObject:[PresetParser parseData:recordData]];
                break;
            case SystemRocker:
                [[system rockerRecords] addObject:[RockerParser parseData:recordData]];
                break;
            case SystemButton:
                [[system buttonRecords] addObject:[ButtonParser parseData:recordData]];
                break;
            case SystemInput:
                [[system inputRecords] addObject:[InputParser parseData:recordData]];
                break;
            case SystemVhc:
                [[system vhcRecords] addObject:[VhcParser parseData:recordData]];
                break;
            case SystemKeypadIndicator:
                [[system keypadRecords] addObject:[KeypadParser parseData:recordData]];
                break;
            case SystemThermostat:
                [[system thermostatRecords] addObject:[ThermostatParser parseData:recordData]];
                break;
            case SystemXpw:
                [[system xpwRecords] addObject:[XpwParser parseData:recordData]];
                break;
            case SystemRfi:
                [[system rfiRecords] addObject:[RfiParser parseData:recordData]];
                break;
            default:
                break;
        }
    }
    
    [system completeImport];
    
    return system;
}

@end
