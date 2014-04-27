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

@property (nonatomic, assign) NSUInteger channelNumber;
@property (nonatomic, assign) NSUInteger componentNumber;
@property (nonatomic, assign) NSUInteger moduleId;
@property (nonatomic, assign) NSUInteger openLinkId;
@property (nonatomic, assign) NSUInteger openCommandId;
@property (nonatomic, assign) NSUInteger openToggleCommandId;
@property (nonatomic, assign) NSUInteger closeLinkId;
@property (nonatomic, assign) NSUInteger closeCommandId;
@property (nonatomic, assign) NSUInteger closeToggleCommandId;

@end
