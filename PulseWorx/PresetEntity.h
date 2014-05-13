//
//  PresetEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/20/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

@interface PresetEntity : PulseWorxEntity

/*
 • Channel # (0 = channel 1, 1 = channel 2, etc)
 • Component # (First component is zero)
 • Module id
 • Link id
 • Preset dim level
 • Preset dim fade rate
 */

@property (nonatomic, assign) uint8_t channelNumber;
@property (nonatomic, assign) uint8_t componentNumber;
@property (nonatomic, assign) uint8_t moduleId;
@property (nonatomic, assign) uint8_t linkId;
@property (nonatomic, assign) uint8_t dimLevel;
@property (nonatomic, assign) uint8_t fadeRate;

@end
