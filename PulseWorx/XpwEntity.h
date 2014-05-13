//
//  XpwEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

@interface XpwEntity : PulseWorxEntity

/*
 • Channel # (always 1)
 • Component
 • Module id
 • Housecode map
 • Command map
 */

@property (nonatomic, assign) uint8_t channelNumber;
@property (nonatomic, assign) uint8_t componentNumber;
@property (nonatomic, assign) uint8_t moduleId;
@property (nonatomic, assign) uint8_t housecodeMap;
@property (nonatomic, assign) uint8_t commandMap;

@end
