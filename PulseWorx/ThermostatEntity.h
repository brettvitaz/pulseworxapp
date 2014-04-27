//
//  ThermostatEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

@interface ThermostatEntity : PulseWorxEntity

/*
 • Channel # (always 1)
 • Always 0
 • Module id
 • String showing Model and Version
 • String showing Model and Version
 • Units
 • Inhibit Link
 • Link base
 • Setpoint Delta
 */

@property (nonatomic, assign) NSUInteger channelNumber;
@property (nonatomic, assign) NSUInteger componentNumber;
@property (nonatomic, assign) NSUInteger moduleId;
@property (nonatomic, assign) NSUInteger modelVersion1;
@property (nonatomic, assign) NSUInteger modelVersion2;
@property (nonatomic, assign) NSUInteger units;
@property (nonatomic, assign) NSUInteger inhibitLink;
@property (nonatomic, assign) NSUInteger linkBase;
@property (nonatomic, assign) NSUInteger setpointDelta;

@end
