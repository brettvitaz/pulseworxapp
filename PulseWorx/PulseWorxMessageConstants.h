//
//  PulseWorxMessageConstants.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/30/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#ifndef PulseWorx_PulseWorxMessageConstants_h
#define PulseWorx_PulseWorxMessageConstants_h

typedef NS_OPTIONS(uint8_t, PWCommunication) {
    PWCommunicationTransmit      = 0x14,
    PWCommunicationReadRegister  = 0x12,
    PWCommunicationWriteRegister = 0x17
};

#define DELIMITER 0x0D

// BYTE 1 - Command Word Byte 1
// BIT 7
typedef NS_OPTIONS(uint8_t, PWPacketType) {
    PWPacketTypeDirect = 0,
    PWPacketTypeLink   = 1 << 7
};

//BIT 6,5
//typedef enum: uint8_t {
typedef NS_OPTIONS(uint8_t, PWRepeaterRequest) {
    PWRepeaterRequestNone = 0,
    PWRepeaterRequestLow  = 1 << 5,
    PWRepeaterRequestMed  = 2 << 5,
    PWRepeaterRequestHigh = 3 << 5
};
// BIT 4,3,2,1,0 - LENGTH

// BYTE 2 - Command Word Byte 2
// BIT 7 - ALWAYS 0
// BIT 6,5,4
typedef NS_OPTIONS(uint8_t, PWAcknowledgeRequest) {
    PWAcknowledgeRequestNone     = 0,
    PWAcknowledgeRequestAckPulse = 1 << 4,
    PWAcknowledgeRequestIdPulse  = 2 << 4,
    PWAcknowledgeRequestMessage  = 4 << 4
};

// BIT 3,2
typedef NS_OPTIONS(uint8_t, PWTransmitCount) {
    PWTransmitCountOneTime    = 0,
    PWTransmitCountTwoTimes   = 1 << 2,
    PWTransmitCountThreeTimes = 2 << 2,
    PWTransmitCountFourTimes  = 3 << 2
};
// BIT 1,0 - NOT USED HERE

// BYTE 3 - Network Id
// BYTE 4 - Destination Id
// BYTE 5 - Source Id
#define SOURCE_ID 0xFF

// BYTE 6 - Message Data Id
/*
 bit 7 - bit 5: MSID: Message Set ID -
 000 Message Set #0 (UPB Core Commands)
 001 Message Set #1 (Device Control Commands)
 010 Message Set #2 (Reserved Command Set #1)
 011 Message Set #3 (Reserved Command Set #2)
 100 Message Set #4 (UPB Core Reports)
 101 Message Set #5 (Reserved Report Set #1)
 110 Message Set #6 (Reserved Report Set #2)
 111 Message Set #7 (Extended Message Set)
 */
#define COMMAND_SET_UPB_CORE        0x00
#define COMMAND_SET_DEVICE_CONTROL  0x20
#define COMMAND_SET_RESERVED1       0x40
#define COMMAND_SET_RESERVED2       0x60
#define COMMAND_SET_UPB_CORE_REPORTS    0x80
#define COMMAND_SET_RESERVED1_REPORTS   0xA0
#define COMMAND_SET_RESERVED2_REPORTS   0xC0
#define COMMAND_SET_EXTENDED            0xE0
/*
 bit 4 - bit 0: MID/ESID: Message Identifier/Extended Set ID -
 For the Extented Message Set this is a 5-bit Extended Set ID.
 For all other Message Sets this is a 5-bit Message Identifier.
 */

// BYTE N - Message
// BYTE N+1 - Checksum

#define COMMAND_ACTIVATE_LINK   COMMAND_SET_DEVICE_CONTROL | 0x00
#define COMMAND_DEACTIVATE_LINK COMMAND_SET_DEVICE_CONTROL | 0x01
#define COMMAND_GOTO_LEVEL      COMMAND_SET_DEVICE_CONTROL | 0x02
#define COMMAND_FADE_START      COMMAND_SET_DEVICE_CONTROL | 0x03
#define COMMAND_FADE_STOP       COMMAND_SET_DEVICE_CONTROL | 0x04
#define COMMAND_BLINK           COMMAND_SET_DEVICE_CONTROL | 0x05
#define COMMAND_INDICATE        COMMAND_SET_DEVICE_CONTROL | 0x06
#define COMMAND_TOGGLE          COMMAND_SET_DEVICE_CONTROL | 0x07
#define COMMAND_REPORT_STATE    COMMAND_SET_DEVICE_CONTROL | 0x10
#define COMMAND_STORE_STATE     COMMAND_SET_DEVICE_CONTROL | 0x11

#define kLevelMax   0x64
#define kLevelMin   0x00

/*
 Fade Rates
 0 = Snap
 1 = 0.8 seconds
 2 = 1.6 seconds
 3 = 3.3 seconds
 4 = 5.0 seconds
 5 = 6.6 seconds
 6 = 10 seconds
 7 = 20 seconds
 8 = 30 seconds
 9 = 1 minute
 10 = 2 minutes
 11 = 5 minutes
 12 = 10 minutes
 13 = 15 minutes
 14 = 30 minutes
 15 = 1 hour
 */
//typedef enum : uint8_t {
typedef NS_ENUM(uint8_t, PWFadeRate) {
    PWFadeRate0,
    PWFadeRate1,
    PWFadeRate2,
    PWFadeRate3,
    PWFadeRate4,
    PWFadeRate5,
    PWFadeRate6,
    PWFadeRate7,
    PWFadeRate8,
    PWFadeRate9,
    PWFadeRate10,
    PWFadeRate11,
    PWFadeRate12,
    PWFadeRate13,
    PWFadeRate14,
    PWFadeRate15,
};


// Registers
#define NETWORK_ID             0x00
#define NETWORK_ID_LEN         0x01
#define MODULE_ID              0x01
#define MODULE_ID_LEN          0x01
#define NETWORK_PASSWORD       0x02
#define NETWORK_PASSWORD_LEN   0x02 // ... 0x03
#define UPB_OPTIONS            0x04
#define UPB_OPTIONS_LEN        0x01
#define UPB_VERSION            0x05
#define UPB_VERSION_LEN        0x01
#define MANUFACTURER_ID        0x06
#define MANUFACTURER_ID_LEN    0x02 // ... 0x07
#define PRODUCT_ID             0x08
#define PRODUCT_ID_LEN         0x02 // ... 0x09
#define VERSION_NUMBER         0x0A
#define VERSION_NUMBER_LEN     0x02 // ... 0x0B
#define SERIAL_NUMBER          0x0C
#define SERIAL_NUMBER_LEN      0x04 // ... 0x0F
#define NETWORK_NAME           0x10
#define NETWORK_NAME_LEN       0x0F // ... 0x1F
#define ROOM_NAME              0x20
#define ROOM_NAME_LEN          0x0F // ... 0x2F
#define DEVICE_NAME            0x30
#define DEVICE_NAME_LEN        0x0F // ... 0x3F
#define PIM_OPTIONS            0x70
#define PIM_OPTIONS_LEN        0x01
#define RESERVED2              0x71
#define RESERVED2_LEN          0x01 // ... 0xF8
#define SIGNAL_STRENGTH        0xF9
#define SIGNAL_STRENGTH_LEN    0x01
#define NOISE_FLOOR            0xFA
#define NOISE_FLOOR_LEN        0x01
#define NOISE_COUNTS           0xFB
#define NOISE_COUNTS_LEN       0x05 // ... 0xFF


#endif
