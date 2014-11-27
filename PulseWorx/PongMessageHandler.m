//
//  PongMessageHandler.m
//  PulseWorx
//
//  Created by Brett Vitaz on 11/23/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PongMessageHandler.h"

#pragma mark Constants
#define TIMER_INTERVAL_SECONDS 20.0

#pragma mark Private Interface
@interface PongMessageHandler ()
- (void)sendNoPingWarning;
- (void)sendPingsOK;
@end

@implementation PongMessageHandler

- (void)dealloc {
    INVALIDATE_TIMER(self.warningTimer);
}

+ (PongMessageHandler *)create {
    PongMessageHandler *handler = [[PongMessageHandler alloc] init];
    handler.pingWarningSent = YES; // Default to warning situation
    return handler;
}

- (void)save:(NSDictionary *)pong {
    [self startTimer];
}

- (void)stop {
    NSLog(@"stopping pong handler");
    [self sendNoPingWarning];
}

- (void)startTimer {
    INVALIDATE_TIMER(self.warningTimer);
    if (self.pingWarningSent) {
        [self sendPingsOK];
    }
    self.warningTimer = [NSTimer scheduledTimerWithTimeInterval:TIMER_INTERVAL_SECONDS
                                                         target:self
                                                       selector:@selector(sendNoPingWarning)
                                                       userInfo:nil
                                                        repeats:NO];
}

#pragma mark Private Methods
- (void)sendNoPingWarning {
    INVALIDATE_TIMER(self.warningTimer);
    if (!self.pingWarningSent) {
        NSLog(@"ping warning!");
        [[NSNotificationCenter defaultCenter] postNotificationName:PING_INTERRUPTED object:nil userInfo:nil];
        self.pingWarningSent = YES;
    }
}

- (void)sendPingsOK {
    self.pingWarningSent = NO;
    NSLog(@"pings OK");
    [[NSNotificationCenter defaultCenter] postNotificationName:PING_RESTORED object:nil userInfo:nil];
}

@end
