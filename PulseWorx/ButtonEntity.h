//
//  ButtonEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

@interface ButtonEntity : PulseWorxEntity

/*
 • Channel #
 • Component #
 • Module id
 • Button link id
 • Single click action
 • Double click action
 • Hold action
 • Release action
 • Single click toggle action
 • Double click toggle action
 • Hold toggle action
 • Release toggle action
 • Indicator link
 • Indicator byte (* see below)
 */

@property (nonatomic, assign) uint8_t channelNumber;
@property (nonatomic, assign) uint8_t componentNumber;
@property (nonatomic, assign) uint8_t moduleId;
@property (nonatomic, assign) uint8_t linkId;
@property (nonatomic, assign) uint8_t singleClickAction;
@property (nonatomic, assign) uint8_t doubleClickAction;
@property (nonatomic, assign) uint8_t holdAction;
@property (nonatomic, assign) uint8_t releaseAction;
@property (nonatomic, assign) uint8_t singleClickToggleAction;
@property (nonatomic, assign) uint8_t doubleClickToggleAction;
@property (nonatomic, assign) uint8_t holdToggleAction;
@property (nonatomic, assign) uint8_t releaseToggleAction;
@property (nonatomic, assign) uint8_t indicatorLinkId;
@property (nonatomic, assign) uint8_t indicatorByte;

@end
