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

@property (nonatomic, assign) NSUInteger channelNumber;
@property (nonatomic, assign) NSUInteger componentNumber;
@property (nonatomic, assign) NSUInteger moduleId;
@property (nonatomic, assign) NSUInteger housecodeMap;
@property (nonatomic, assign) NSUInteger commandMap;

@end
