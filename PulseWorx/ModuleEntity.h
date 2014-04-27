//
//  ModuleEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/16/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

typedef enum : NSUInteger {
    OTHER,
    KEYPAD,
    SWITCH,
    MODULE,
    INPUT_MODULE,
    INPUT_OUTPUT_MODULE,
    VPM,
    VHC,
    THERMOSTAT,
} Kind;

typedef enum : NSUInteger {
    DIRECT,
    LINK,
} PacketType;

@interface ModuleEntity : PulseWorxEntity

@property (nonatomic, assign) NSUInteger moduleId;
@property (nonatomic, assign) NSUInteger networkId;
@property (nonatomic, assign) NSUInteger manufacturerId;
@property (nonatomic, assign) NSUInteger productId;
@property (nonatomic, assign) NSUInteger firmwareVersionMajor;
@property (nonatomic, assign) NSUInteger firmwareVersionMinor;
@property (nonatomic, assign) Kind kind;
@property (nonatomic, assign) NSUInteger numberOfChannels;
@property (nonatomic, assign) NSUInteger numberOfTransmitComponents;
@property (nonatomic, assign) NSUInteger numberOfReceiveComponents;
@property (nonatomic) NSString *roomName;
@property (nonatomic) NSString *deviceName;
@property (nonatomic, assign) PacketType packetType;
//@property (nonatomic) NSArray *memoryContents;

@end
