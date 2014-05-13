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

@property (nonatomic, readwrite) uint8_t deviceId;
@property (nonatomic, readwrite) uint8_t networkId;

- (NSData *)getCommand;

@end

@implementation PulseWorxCommand

- (id)initWithId:(uint8_t)deviceId forNetwork:(uint8_t)networkId {
    if (self = [super init]) {
        [self setDeviceId:deviceId];
        [self setNetworkId:networkId];
    }
    return self;
}

- (NSData *)createHeader:(LinkType)linkType withLength:(uint8_t)length {
    const char packetHeader[] = {
        (linkType | REPEAT_NONE | (PACKET_LENGTH + length)),
        (ACKNOWLEDGE_ACK | TRANSMIT_2_TIMES),
        [self networkId],
        [self deviceId],
        SOURCE_ID };
    return [NSData dataWithBytes:packetHeader length:sizeof(packetHeader)];
}

- (NSData *)getData {
    
    NSData *theCommand = [self getCommand];
    
    NSMutableData *command = [NSMutableData dataWithData:[self createHeader:[self getType] withLength:[theCommand length]]];
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

- (char)getType {
    return 0;
}

- (uint8_t)calculateChecksum:(uint8_t *)bytes withSize:(size_t)size{
    NSLog(@"%s",bytes);
    char sum = 0;
    for (int i = 0; i < size; i++) {
        sum += bytes[i];
    }
    return (sum ^ 0xFF) + 0x01;
}

@end
