//
//  PresetParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/20/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PresetParser.h"

typedef NS_ENUM(NSUInteger, PresetRecordType) {
    PresetChannelNumber = 1,
    PresetComponentNumber,
    PresetModuleId,
    PresetLinkId,
    PresetPresetDimLevel,
    PresetPresetDimFadeRate,
};

@implementation PresetParser

+ (PresetEntity *)parseData:(NSArray *)data {
    PresetEntity *entity = [[PresetEntity alloc] init];
    
    [entity setComponentNumber:[[data objectAtIndex:PresetComponentNumber] integerValue]];
    [entity setChannelNumber:[[data objectAtIndex:PresetChannelNumber] integerValue]];
    [entity setModuleId:[[data objectAtIndex:PresetModuleId] integerValue]];
    [entity setLinkId:[[data objectAtIndex:PresetLinkId] integerValue]];
    [entity setDimLevel:[[data objectAtIndex:PresetPresetDimLevel] integerValue]];
    [entity setFadeRate:[[data objectAtIndex:PresetPresetDimFadeRate] integerValue]];
    
    return entity;
}

@end
