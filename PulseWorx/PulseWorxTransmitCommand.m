//
//  PulseWorxMessage.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/30/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxTransmitCommand.h"
#import "NSData+Conversion.h"
#import "PulseWorxController.h"

#define PACKET_LENGTH 6 // header + checksum

@interface PulseWorxTransmitCommand()

@property (nonatomic, readwrite, assign) uint8_t messageType;
@property (nonatomic, readwrite, assign) uint8_t deviceId;
//@property (nonatomic, readwrite, assign) uint8_t networkId;

- (uint8_t)getType;
- (uint8_t)calculateChecksum:(uint8_t *)bytes withSize:(size_t)size;

@end

@implementation PulseWorxTransmitCommand

- (id)init {
    return nil;
}

- (id)initLink:(uint8_t)linkId {
    if (self = [super init]) {
        self.deviceId = linkId;
//        self.networkId = networkId;
        self.messageType = PWPacketTypeLink;
    }
    return self;
}

- (id)initModule:(uint8_t)moduleId {
    if (self = [super init]) {
        self.deviceId = moduleId;
//        self.networkId = networkId;
        self.messageType = PWPacketTypeDirect;
    }
    return self;
}

// With length of data, not including header.
- (NSData *)headerWithLength:(uint8_t)length {
    const char packetHeader[] = {
        ([self getType] | PWRepeaterRequestNone | (PACKET_LENGTH + length)),
        (PWAcknowledgeRequestAckPulse | PWTransmitCountTwoTimes), [self getNetworkId], self.deviceId, SOURCE_ID };
    return [NSData dataWithBytes:packetHeader length:sizeof(packetHeader)];
}

- (NSData *)getData {
    
    NSData *theCommand = [self getCommand];
    
    NSMutableData *command = [NSMutableData dataWithData:[self headerWithLength:[theCommand length]]];
    [command appendData:theCommand];
    
    uint8_t *checksumBytes = malloc([command length]);
    [command getBytes:checksumBytes];
    
    char checksum[] = { [self calculateChecksum:checksumBytes withSize:[command length]] };
    [command appendBytes:checksum length:sizeof(checksum)];
    NSLog(@"%@", command);
    
    char preamble[] = { PWCommunicationTransmit };
    char delimiter[] = { DELIMITER };
    NSMutableData *message = [NSMutableData dataWithBytes:preamble length:sizeof(preamble)];
    
    [message appendBytes:[[command hexadecimalString] UTF8String] length:[command length] * 2];
    [message appendBytes:delimiter length:sizeof(delimiter)];
    
    return message;
}

- (NSData *)getCommand {
    return nil;
}

- (uint8_t)getType {
    return self.messageType;
}

- (uint8_t)calculateChecksum:(uint8_t *)bytes withSize:(size_t)size {
    NSLog(@"%s",bytes);
    uint8_t sum = 0;
    for (int i = 0; i < size; i++) {
        sum += bytes[i];
    }
    return (sum ^ 0xFF) + 0x01;
}

- (uint8_t)getNetworkId {
    return [PulseWorxController sharedInstance].pulseWorxSystem.fileRecord.networkId;
}

@end
