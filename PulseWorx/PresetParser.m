//
//  PresetParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/20/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PresetParser.h"

typedef enum : uint8_t {
    PresetChannelNumber = 1,
    PresetComponentNumber,
    PresetModuleId,
    PresetLinkId,
    PresetPresetDimLevel,
    PresetPresetDimFadeRate,
} PresetRecordType;

@implementation PresetParser

+ (PresetEntity *)parseData:(NSArray *)data {
    PresetEntity *entity = [[PresetEntity alloc] init];
    
    [entity setComponentNumber:[[data objectAtIndex:PresetComponentNumber] intValue]];
    [entity setChannelNumber:[[data objectAtIndex:PresetChannelNumber] intValue]];
    [entity setModuleId:[[data objectAtIndex:PresetModuleId] intValue]];
    [entity setLinkId:[[data objectAtIndex:PresetLinkId] intValue]];
    [entity setDimLevel:[[data objectAtIndex:PresetPresetDimLevel] intValue]];
    [entity setFadeRate:[[data objectAtIndex:PresetPresetDimFadeRate] intValue]];
    
    [entity setEntityId:[[data objectAtIndex:PresetModuleId] intValue]];

    return entity;
}

@end
