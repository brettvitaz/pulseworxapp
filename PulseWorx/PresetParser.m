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
    
    entity.componentNumber = [[data objectAtIndex:PresetComponentNumber] intValue];
    entity.channelNumber = [[data objectAtIndex:PresetChannelNumber] intValue];
    entity.moduleId = [[data objectAtIndex:PresetModuleId] intValue];
    entity.linkId = [[data objectAtIndex:PresetLinkId] intValue];
    entity.dimLevel = [[data objectAtIndex:PresetPresetDimLevel] intValue];
    entity.fadeRate = [[data objectAtIndex:PresetPresetDimFadeRate] intValue];
    
    entity.entityId = [[data objectAtIndex:PresetModuleId] intValue];

    return entity;
}

@end
