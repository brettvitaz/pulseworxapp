//
//  PulseWorxSystem.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/13/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"
#import "FileRecordEntity.h"

//@class FileRecordEntity;
@class PulseWorxEntitySet;

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
@property (nonatomic) PulseWorxEntitySet *linkRecords;
@property (nonatomic) PulseWorxEntitySet *moduleRecords;
@property (nonatomic) PulseWorxEntitySet *channelRecords;
@property (nonatomic) PulseWorxEntitySet *presetRecords;
@property (nonatomic) PulseWorxEntitySet *rockerRecords;
@property (nonatomic) PulseWorxEntitySet *buttonRecords;
@property (nonatomic) PulseWorxEntitySet *inputRecords;
@property (nonatomic) PulseWorxEntitySet *vhcRecords;
@property (nonatomic) PulseWorxEntitySet *keypadRecords;
@property (nonatomic) PulseWorxEntitySet *thermostatRecords;
@property (nonatomic) PulseWorxEntitySet *xpwRecords;
@property (nonatomic) PulseWorxEntitySet *rfiRecords;

- (void)completeImport;

- (NSArray *)getRoomNames;

- (NSArray *)getLinksForRoom:(NSString *)roomName;
- (NSArray *)getLoadsForRoom:(NSString *)roomName;
- (NSArray *)getDevicesForRoom:(NSString *)roomName;

- (NSArray *)getButtonsForKeypad:(uint8_t)moduleId;

- (NSArray *)getChannelsForDevice:(uint8_t)moduleId;

@end
