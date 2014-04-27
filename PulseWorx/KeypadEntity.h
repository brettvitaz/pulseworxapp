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

@property (nonatomic, assign) NSUInteger channelNumber;
@property (nonatomic, assign) NSUInteger componentNumber;
@property (nonatomic, assign) NSUInteger moduleId;
@property (nonatomic, assign) NSUInteger linkId;
@property (nonatomic, assign) NSUInteger mask1;
@property (nonatomic, assign) NSUInteger mask2;

@end
