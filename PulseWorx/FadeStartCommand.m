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
@property (nonatomic, assign) BOOL defaultRate;
@property (nonatomic, assign) BOOL defaultChannel;

@end

@implementation FadeStartCommand

- (id)initWithId:(uint8_t)theId forNetwork:(uint8_t)networkId forChannel:(uint8_t)channelId withLevel:(uint8_t)level withFadeRate:(FadeRates)fadeRate {
    if (self = [super initWithId:theId forNetwork:networkId]) {
        [self setChannelId:channelId];
        [self setFadeRate:fadeRate];
        [self setLevel:level];
    }
    return self;
}

- (id)initWithId:(uint8_t)theId forNetwork:(uint8_t)networkId forChannel:(uint8_t)channelId withLevel:(uint8_t)level {
    return [self initWithId:theId forNetwork:networkId forChannel:channelId withLevel:level withFadeRate:RATE_1];
}

- (id)initWithId:(uint8_t)theId forNetwork:(uint8_t)networkId withLevel:(uint8_t)level withFadeRate:(FadeRates)fadeRate {
    if (self = [self initWithId:theId forNetwork:networkId forChannel:0 withLevel:level withFadeRate:fadeRate]) {
        [self setDefaultChannel:YES];
    }
    return self;
}

- (NSData *)getCommand {
    // fade start, level, rate, channel
    uint8_t command[[self defaultChannel] ? 3 : 4]; // = malloc([self defaultChannel] ? 3 : 4);
    command[0] = COMMAND_FADE_START;
    command[1] = [self level];
    command[2] = [self fadeRate];
    if (![self defaultChannel]) {
        command[3] = [self channelId];
    }
    return [NSData dataWithBytes:command length:sizeof(command)];
}

@end
