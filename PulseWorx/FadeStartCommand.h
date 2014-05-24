//
//  FadeCommand.h
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxCommand.h"

@interface FadeStartCommand : PulseWorxCommand

- (id)initLink:(uint8_t)linkId forNetwork:(uint8_t)networkId withLevel:(uint8_t)level;
- (id)initLink:(uint8_t)linkId forNetwork:(uint8_t)networkId withLevel:(uint8_t)level withFadeRate:(FadeRates)fadeRate;

- (id)initModule:(uint8_t)moduleId forNetwork:(uint8_t)networkId withLevel:(uint8_t)level;
- (id)initModule:(uint8_t)moduleId forNetwork:(uint8_t)networkId withLevel:(uint8_t)level withFadeRate:(FadeRates)fadeRate;
- (id)initModule:(uint8_t)moduleId forNetwork:(uint8_t)networkId forChannel:(uint8_t)channelId withLevel:(uint8_t)level withFadeRate:(FadeRates)fadeRate;

@end
