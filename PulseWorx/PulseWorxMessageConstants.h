//
//  PulseWorxMessageConstants.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/30/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#ifndef PulseWorx_PulseWorxMessageConstants_h
#define PulseWorx_PulseWorxMessageConstants_h

typedef enum : uint8_t {
    TRANSMIT       = 0x14,
    READ_REGISTER  = 0x12,
    WRITE_REGISTER = 0x17,
} CommunicationType;

#define DELIMITER 0x0D

// BYTE 1 - Command Word Byte 1
// BIT 7
typedef enum : uint8_t {
    TYPE_DIRECT = 0x00,
    TYPE_LINK   = 0x80,
} LinkType;
//BIT 6,5
typedef enum: uint8_t {
    REPEAT_NONE = 0x00,
    REPEAT_LOW  = 0x20,
    REPEAT_MED  = 0x40,
    REPEAT_HIGH = 0x60,
} RepeaterRequest;
// BIT 4,3,2,1,0 - LENGTH

// BYTE 2 - Command Word Byte 2
// BIT 7 - ALWAYS 0
// BIT 6,5,4
typedef enum : uint8_t {
    ACKNOWLEDGE_ACK     = 0x10,
    ACKNOWLEDGE_ID      = 0x20,
    ACKNOWLEDGE_MESSAGE = 0x40,
} AcknowledgeRequest;
// BIT 3,2
typedef enum : uint8_t {
    TRANSMIT_1_TIME  = 0x00,
    TRANSMIT_2_TIMES = 0x04,
    TRANSMIT_3_TIMES = 0x08,
    TRANSMIT_4_TIMES = 0x0C,
} TransmitCount;
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

#define LEVEL_MAX   0x64
#define LEVEL_MIN   0x00

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
typedef enum : uint8_t {
    RATE_0 = 0,
    RATE_1,
    RATE_2,
    RATE_3,
    RATE_4,
    RATE_5,
    RATE_6,
    RATE_7,
    RATE_8,
    RATE_9,
    RATE_10,
    RATE_11,
    RATE_12,
    RATE_13,
    RATE_14,
    RATE_15,
} FadeRates;




#endif
