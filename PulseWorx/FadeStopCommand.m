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
@property (nonatomic, assign, getter = isDefaultChannel) BOOL defaultChannel;

@end
@implementation FadeStopCommand

- (id)initLink:(uint8_t)linkId {
    self = [super initLink:linkId];
    if (self) {
        self.defaultChannel = YES;
    }
    return self;
}

- (id)initModule:(uint8_t)moduleId {
    if (self = [super initModule:moduleId]) {
        self.defaultChannel = YES;
    }
    return  self;
}

- (id)initModule:(uint8_t)moduleId forChannel:(uint8_t)channelId {
    if (self = [super initModule:moduleId]) {
        self.channelId = channelId;
        self.defaultChannel = NO;
    }
    return  self;
}

- (NSData *)getCommand {
    uint8_t command[2];
    int dataLength = 0;
    command[dataLength] = COMMAND_FADE_STOP;
    if (!self.isDefaultChannel) {
        command[++dataLength] = self.channelId;
    }
    return [NSData dataWithBytes:command length:++dataLength];
}

@end
