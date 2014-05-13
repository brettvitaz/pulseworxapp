//
//  FadeStopCommand.h
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "DirectCommand.h"

@interface FadeStopCommand : DirectCommand

- (id)initWithId:(uint8_t)theId forNetwork:(uint8_t)networkId forChannel:(uint8_t)channelId;

@end
