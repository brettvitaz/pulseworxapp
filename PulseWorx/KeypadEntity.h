//
//  KeypadEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

@interface KeypadEntity : PulseWorxEntity

/*
 • Channel # (always 1)
 • Component number (First component is zero, there are 16 components)
 • Module id
 • Link id
 • Mask1
 • Mask2
 */

@property (nonatomic, assign) uint8_t channelNumber;
@property (nonatomic, assign) uint8_t componentNumber;
@property (nonatomic, assign) uint8_t moduleId;
@property (nonatomic, assign) uint8_t linkId;
@property (nonatomic, assign) uint8_t mask1;
@property (nonatomic, assign) uint8_t mask2;

@end
