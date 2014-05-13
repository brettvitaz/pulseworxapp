//
//  RockerEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

@interface RockerEntity : PulseWorxEntity
/*
 • Channel #
 • Component # (always zero)
 • Module id
 • Top rocker transmit link id
 • Top rocker single click action
 • Top rocker double click action
 • Top rocker hold action
 • Top rocker release action
 • Bottom rocker transmit link id
 • Bottom rocker single click action
 • Bottom rocker double click action
 • Bottom rocker hold action
 • Bottom rocker release action
 */

@property (nonatomic, assign) uint8_t channelNumber;
@property (nonatomic, assign) uint8_t componentNumber;
@property (nonatomic, assign) uint8_t moduleId;
@property (nonatomic, assign) uint8_t topRockerLinkId;
@property (nonatomic, assign) uint8_t topRockerSingleClickAction;
@property (nonatomic, assign) uint8_t topRockerDoubleClickAction;
@property (nonatomic, assign) uint8_t topRockerHoldAction;
@property (nonatomic, assign) uint8_t topRockerReleaseAction;
@property (nonatomic, assign) uint8_t bottomRockerLinkId;
@property (nonatomic, assign) uint8_t bottomRockerSingleClickAction;
@property (nonatomic, assign) uint8_t bottomRockerDoubleClickAction;
@property (nonatomic, assign) uint8_t bottomRockerHoldAction;
@property (nonatomic, assign) uint8_t bottomRockerReleaseAction;


@end
