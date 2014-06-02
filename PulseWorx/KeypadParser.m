//
//  KeypadParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "KeypadParser.h"

typedef enum : uint8_t {
    KeypadChannelNumber = 1,
    KeypadComponentNumber,
    KeypadModuleId,
    KeypadLinkId,
    KeypadMask1,
    KeypadMask2,
} KeypadRecordType;

@implementation KeypadParser

+ (KeypadEntity *)parseData:(NSArray *)data {
    KeypadEntity *entity = [[KeypadEntity alloc] init];
    
    entity.channelNumber = [[data objectAtIndex:KeypadChannelNumber] intValue];
    entity.componentNumber = [[data objectAtIndex:KeypadComponentNumber] intValue];
    entity.moduleId = [[data objectAtIndex:KeypadModuleId] intValue];
    entity.linkId = [[data objectAtIndex:KeypadLinkId] intValue];
    entity.mask1 = [[data objectAtIndex:KeypadMask1] intValue];
    entity.mask2 = [[data objectAtIndex:KeypadMask2] intValue];
    
    entity.entityId = [[data objectAtIndex:KeypadModuleId] intValue];

    return entity;
}

@end
