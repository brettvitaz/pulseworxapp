//
//  FadeStopCommand.m
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "FadeStopCommand.h"

@interface FadeStopCommand()

@property (nonatomic, assign) uint8_t channelId;

@end
@implementation FadeStopCommand

- (id)initWithId:(uint8_t)theId forNetwork:(uint8_t)networkId forChannel:(uint8_t)channelId {
    if (self = [super initWithId:theId forNetwork:networkId]) {
        [self setChannelId:channelId];
    }
    return  self;
}

- (NSData *)getCommand {
    uint8_t command[] = { COMMAND_FADE_STOP };
    return [NSData dataWithBytes:command length:sizeof(command)];
}

@end
