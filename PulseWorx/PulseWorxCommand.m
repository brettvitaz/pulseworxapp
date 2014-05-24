//
//  PulseWorxMessage.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/30/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxCommand.h"
#import "NSData+Conversion.h"

#define PACKET_LENGTH 6 // header + checksum

@interface PulseWorxCommand()

@property (nonatomic, readwrite, assign) uint8_t messageType;
@property (nonatomic, readwrite, assign) uint8_t deviceId;
@property (nonatomic, readwrite, assign) uint8_t networkId;

- (uint8_t)getType;
- (uint8_t)calculateChecksum:(uint8_t *)bytes withSize:(size_t)size;

@end

@implementation PulseWorxCommand

- (id)init {
    return nil;
}

- (id)initLink:(uint8_t)linkId forNetwork:(uint8_t)networkId {
    if (self = [super init]) {
        self.deviceId = linkId;
        self.networkId = networkId;
        self.messageType = TYPE_LINK;
    }
    return self;
}

- (id)initModule:(uint8_t)moduleId forNetwork:(uint8_t)networkId {
    if (self = [super init]) {
        self.deviceId = moduleId;
        self.networkId = networkId;
        self.messageType = TYPE_DIRECT;
    }
    return self;
}

// With length of data, not including header.
- (NSData *)headerWithLength:(uint8_t)length {
    const char packetHeader[] = {
        ([self getType] | REPEAT_NONE | (PACKET_LENGTH + length)),
        (ACKNOWLEDGE_ACK | TRANSMIT_2_TIMES),
        [self networkId],
        [self deviceId],
        SOURCE_ID };
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
    
    char preamble[] = { TRANSMIT };
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

@end
