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

@property (nonatomic, assign) NSUInteger channelNumber;
@property (nonatomic, assign) NSUInteger componentNumber;
@property (nonatomic, assign) NSUInteger moduleId;
@property (nonatomic, assign) NSUInteger linkId;
@property (nonatomic, assign) NSUInteger dimLevel;
@property (nonatomic, assign) NSUInteger fadeRate;

@end
