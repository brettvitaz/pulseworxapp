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

typedef enum : NSUInteger {
    BEGIN,
    END,
    LINK,
    ID,
    PRESET,
    ROCKER,
    BUTTON,
    INPUT,
    CHANNEL_INFO,
    VHC,
    INSTALLER_INFO,
    OWNER_INFO,
    DEVICE_MEMORY,
    KEYPAD_INDICATOR,
    THERMOSTAT,
    XPW,
    RFI,
} SystemRecordData;

@implementation PulseWorxSystemParser

- (id)initWithData:(NSArray *)parseData {
    if (self = [super init]) {
        [self parse:parseData];
    }
    return self;
}

- (void)parse:(NSArray *)parseData {
    PulseWorxSystem *system = [[PulseWorxSystem alloc] init];
    NSMutableArray *linkArray = [[NSMutableArray alloc] init];
    for (NSArray *recordData in parseData) {
        switch ([[recordData objectAtIndex:0] integerValue]) {
            case BEGIN:
                [system setFileRecord:[FileRecordParser parseData:recordData]];
                break;
            case END:
                break;
            case LINK:
                [linkArray addObject:[[LinkParser alloc] initWithData:recordData]];
            default:
                break;
        }
    }
    
    _pulseworxSystem = system;
}

@end
