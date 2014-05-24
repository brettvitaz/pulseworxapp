//
//  FadeCommand.m
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "FadeStartCommand.h"

@interface FadeStartCommand()

@property (nonatomic, assign) uint8_t level;
@property (nonatomic, assign) uint8_t fadeRate;
@property (nonatomic, assign) uint8_t channelId;
@property (nonatomic, assign, getter = isDefaultFadeRate) BOOL defaultFadeRate;
@property (nonatomic, assign, getter = isDefaultChannel) BOOL defaultChannel;

@end

@implementation FadeStartCommand

- (id)initLink:(uint8_t)linkId forNetwork:(uint8_t)networkId withLevel:(uint8_t)level {
    self = [self initLink:linkId forNetwork:networkId withLevel:level withFadeRate:RATE_0];
    if (self) {
        self.defaultFadeRate = YES;
    }
    return self;
}

- (id)initLink:(uint8_t)linkId forNetwork:(uint8_t)networkId withLevel:(uint8_t)level withFadeRate:(FadeRates)fadeRate {
    self = [super initLink:linkId forNetwork:networkId];
    if (self) {
        self.defaultChannel = YES;
    }
    return self;
}

- (id)initModule:(uint8_t)moduleId forNetwork:(uint8_t)networkId withLevel:(uint8_t)level {
    self = [self initModule:moduleId forNetwork:networkId forChannel:0 withLevel:level withFadeRate:RATE_0];
    if (self) {
        self.defaultChannel = YES;
        self.defaultFadeRate = YES;
    }
    return self;
}

- (id)initModule:(uint8_t)moduleId forNetwork:(uint8_t)networkId withLevel:(uint8_t)level withFadeRate:(FadeRates)fadeRate {
    self = [self initModule:moduleId forNetwork:networkId forChannel:0 withLevel:level withFadeRate:fadeRate];
    if (self) {
        self.defaultChannel = YES;
    }
    return self;
}

- (id)initModule:(uint8_t)moduleId forNetwork:(uint8_t)networkId forChannel:(uint8_t)channelId withLevel:(uint8_t)level withFadeRate:(FadeRates)fadeRate {
    self = [super initModule:moduleId forNetwork:networkId];
    if (self) {
        self.channelId = channelId;
        self.fadeRate = fadeRate;
        self.level = level;
    }
    return self;
}

// Create a command with the format: fade start, level, [rate, [channel]].
- (NSData *)getCommand {
    int dataLength = 0;
    uint8_t command[4];
    command[dataLength] = COMMAND_FADE_START;
    command[++dataLength] = self.level;
    if (!self.isDefaultFadeRate) {
        command[++dataLength] = self.fadeRate;
        if (!self.isDefaultChannel) {
            command[++dataLength] = self.channelId;
        }
    }
    return [NSData dataWithBytes:command length:++dataLength];
}

@end
