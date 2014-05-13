//
//  ChannelInfoEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/20/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

@interface ChannelInfoEntity : PulseWorxEntity

@property (nonatomic, assign) uint8_t channelNumber;
@property (nonatomic, assign) uint8_t moduleId;
@property (nonatomic, assign, getter = isDimEnabled) BOOL dimEnabled;
@property (nonatomic, assign) uint8_t fadeRate;

@property (nonatomic, assign) uint8_t currentLevel;

@end
