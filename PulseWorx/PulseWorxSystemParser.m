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

typedef NS_ENUM(NSUInteger, SystemRecordType) {
    SRTBegin = 0,
    SRTEnd,
    SRTLink,
    SRTModule,
    SRTPreset,
    SRTRocker,
    SRTButton,
    SRTInput,
    SRTChannelInfo,
    SRTVhc,
    SRTInstallerInfo,
    SRTOwnerInfo,
    SRTDeviceMemory,
    SRTKeypadIndicator,
    SRTThermostat,
    SRTXpw,
    SRTRfi,
};

@implementation PulseWorxSystemParser

- (id)initWithData:(NSArray *)data {
    if (self = [super init]) {
        [self parse:data];
    }
    return self;
}

- (void)parse:(NSArray *)data {
    PulseWorxSystem *system = [[PulseWorxSystem alloc] init];
    NSMutableArray *linkArray = [[NSMutableArray alloc] init];
    NSMutableArray *moduleArray = [[NSMutableArray alloc] init];
    NSMutableArray *channelInfoArray = [[NSMutableArray alloc] init];

    for (NSUInteger i = 0; i < [data count]; i++) {
        NSArray *recordData = [data objectAtIndex:i];
        
        switch ([[recordData objectAtIndex:0] integerValue]) {
            case SRTBegin:
                [system setFileRecord:[FileRecordParser parseData:recordData]];
                break;
            case SRTEnd:
                break;
            case SRTLink:
                [linkArray addObject:[LinkParser parseData:recordData]];
                break;
            case SRTModule:
                [moduleArray addObject:[ModuleParser parseData:recordData]];
//            {
//                NSUInteger start = i;
//                NSUInteger end = 1;
//                while ([[[data objectAtIndex:start + end] objectAtIndex:0] integerValue] != MODULE) {
//                    end++;
//                }
//                [idArray addObject:[ModuleParser parseData:[data subarrayWithRange:NSMakeRange(start, end)]]];
//            }
                break;
            case SRTChannelInfo:
                [channelInfoArray addObject:[ChannelInfoParser parseData:recordData]];
                break;
            default:
                break;
        }
    }
    
    [system setLinkRecords:linkArray];
    
    _pulseworxSystem = system;
}

@end
