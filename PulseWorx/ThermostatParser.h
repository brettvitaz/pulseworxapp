//
//  ThermostatParser.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThermostatEntity.h"

@interface ThermostatParser : NSObject

+ (ThermostatEntity *)parseData:(NSArray *)data;

@end
