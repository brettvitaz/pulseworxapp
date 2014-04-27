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

@property (nonatomic, assign) NSUInteger channelNumber;
@property (nonatomic, assign) NSUInteger componentNumber;
@property (nonatomic, assign) NSUInteger moduleId;
@property (nonatomic, assign) NSUInteger linkId;
@property (nonatomic, assign) NSUInteger singleClickAction;
@property (nonatomic, assign) NSUInteger doubleClickAction;
@property (nonatomic, assign) NSUInteger holdAction;
@property (nonatomic, assign) NSUInteger releaseAction;
@property (nonatomic, assign) NSUInteger singleClickToggleAction;
@property (nonatomic, assign) NSUInteger doubleClickToggleAction;
@property (nonatomic, assign) NSUInteger holdToggleAction;
@property (nonatomic, assign) NSUInteger releaseToggleAction;
@property (nonatomic, assign) NSUInteger indicatorLinkId;
@property (nonatomic, assign) NSUInteger indicatorByte;

@end
