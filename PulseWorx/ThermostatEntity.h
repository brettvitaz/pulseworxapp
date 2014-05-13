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

@property (nonatomic, assign) uint8_t channelNumber;
@property (nonatomic, assign) uint8_t componentNumber;
@property (nonatomic, assign) uint8_t moduleId;
@property (nonatomic, assign) uint8_t modelVersion1;
@property (nonatomic, assign) uint8_t modelVersion2;
@property (nonatomic, assign) uint8_t units;
@property (nonatomic, assign) uint8_t inhibitLink;
@property (nonatomic, assign) uint8_t linkBase;
@property (nonatomic, assign) uint8_t setpointDelta;

@end
