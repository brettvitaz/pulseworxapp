//
//  ModuleEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/16/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

typedef enum : uint8_t {
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

typedef enum : uint8_t {
    DIRECT,
    LINK,
} PacketType;

@interface ModuleEntity : PulseWorxEntity

@property (nonatomic, assign) uint8_t moduleId;
@property (nonatomic, assign) uint8_t networkId;
@property (nonatomic, assign) uint8_t manufacturerId;
@property (nonatomic, assign) uint8_t productId;
@property (nonatomic, assign) uint8_t firmwareVersionMajor;
@property (nonatomic, assign) uint8_t firmwareVersionMinor;
@property (nonatomic, assign) Kind kind;
@property (nonatomic, assign) uint8_t numberOfChannels;
@property (nonatomic, assign) uint8_t numberOfTransmitComponents;
@property (nonatomic, assign) uint8_t numberOfReceiveComponents;
@property (nonatomic, copy) NSString *roomName;
@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, assign) PacketType packetType;
//@property (nonatomic) NSArray *memoryContents;

@end
