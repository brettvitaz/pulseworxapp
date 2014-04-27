//
//  PulseWorxSystem.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/13/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"
#import "FileRecordEntity.h"

@interface PulseWorxSystem : PulseWorxEntity

/*
 • 0 = BOF (begin of file)
 • 1 = EOF (end of file)
 • 2 = Link
 • 3 = Id
 • 4 = Preset
 • 5 = Rocker
 • 6 = Button
 • 7 = Input
 • 8 = Channel info
 • 9 = VHC (Vacuum Handle Controller: An MD Manufacturing product)
 • 10 = Installer info
 • 11 = Owner info
 • 12 = Device memory (hex)
 • 13 = Keypad indicator line
 • 14 = Thermostat line
 • 15 = XPW
 • 16 = RFI
 */

@property (nonatomic) FileRecordEntity *fileRecord;
@property (nonatomic) NSArray *linkRecords;
@property (nonatomic) NSArray *moduleRecords;
@property (nonatomic) NSArray *channelRecords;

@end
