//
//  InputEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

@interface InputEntity : PulseWorxEntity

/*
 • Channel #
 • Component #
 • Module id
 • Open link id
 • Open command id
 • Open toggle command id
 • Close link id
 • Close command id
 • Close toggle command id
 */

@property (nonatomic, assign) uint8_t channelNumber;
@property (nonatomic, assign) uint8_t componentNumber;
@property (nonatomic, assign) uint8_t moduleId;
@property (nonatomic, assign) uint8_t openLinkId;
@property (nonatomic, assign) uint8_t openCommandId;
@property (nonatomic, assign) uint8_t openToggleCommandId;
@property (nonatomic, assign) uint8_t closeLinkId;
@property (nonatomic, assign) uint8_t closeCommandId;
@property (nonatomic, assign) uint8_t closeToggleCommandId;

@end
