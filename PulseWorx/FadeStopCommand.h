//
//  FadeStopCommand.h
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxTransmitCommand.h"

@interface FadeStopCommand : PulseWorxTransmitCommand

- (id)initLink:(uint8_t)linkId;
- (id)initModule:(uint8_t)moduleId;
- (id)initModule:(uint8_t)moduleId forChannel:(uint8_t)channelId;

@end
