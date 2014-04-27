//
//  KeypadParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "KeypadParser.h"

typedef NS_ENUM(NSUInteger, KeypadRecordType) {
    KeypadChannelNumber = 1,
    KeypadComponentNumber,
    KeypadModuleId,
    KeypadLinkId,
    KeypadMask1,
    KeypadMask2,
};

@implementation KeypadParser

+ (KeypadEntity *)parseData:(NSArray *)data {
    KeypadEntity *entity = [[KeypadEntity alloc] init];
    
    [entity setChannelNumber:[[data objectAtIndex:KeypadChannelNumber] integerValue]];
    [entity setComponentNumber:[[data objectAtIndex:KeypadComponentNumber] integerValue]];
    [entity setModuleId:[[data objectAtIndex:KeypadModuleId] integerValue]];
    [entity setLinkId:[[data objectAtIndex:KeypadLinkId] integerValue]];
    [entity setMask1:[[data objectAtIndex:KeypadMask1] integerValue]];
    [entity setMask2:[[data objectAtIndex:KeypadMask2] integerValue]];
    
    return entity;
}

@end
