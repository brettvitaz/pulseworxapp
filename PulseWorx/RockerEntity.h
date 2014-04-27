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

@property (nonatomic, assign) NSUInteger channelNumber;
@property (nonatomic, assign) NSUInteger componentNumber;
@property (nonatomic, assign) NSUInteger moduleId;
@property (nonatomic, assign) NSUInteger topRockerLinkId;
@property (nonatomic, assign) NSUInteger topRockerSingleClickAction;
@property (nonatomic, assign) NSUInteger topRockerDoubleClickAction;
@property (nonatomic, assign) NSUInteger topRockerHoldAction;
@property (nonatomic, assign) NSUInteger topRockerReleaseAction;
@property (nonatomic, assign) NSUInteger bottomRockerLinkId;
@property (nonatomic, assign) NSUInteger bottomRockerSingleClickAction;
@property (nonatomic, assign) NSUInteger bottomRockerDoubleClickAction;
@property (nonatomic, assign) NSUInteger bottomRockerHoldAction;
@property (nonatomic, assign) NSUInteger bottomRockerReleaseAction;


@end
