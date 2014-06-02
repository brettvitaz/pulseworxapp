//
//  FadeCommand.h
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxTransmitCommand.h"

@interface FadeStartCommand : PulseWorxTransmitCommand

- (id)initLink:(uint8_t)linkId withLevel:(uint8_t)level;
- (id)initLink:(uint8_t)linkId withLevel:(uint8_t)level withFadeRate:(PWFadeRate)fadeRate;

- (id)initModule:(uint8_t)moduleId withLevel:(uint8_t)level;
- (id)initModule:(uint8_t)moduleId withLevel:(uint8_t)level withFadeRate:(PWFadeRate)fadeRate;
- (id)initModule:(uint8_t)moduleId forChannel:(uint8_t)channelId withLevel:(uint8_t)level withFadeRate:(PWFadeRate)fadeRate;

@end
