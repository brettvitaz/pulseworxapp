//
//  MessageRouter.m
//  PulseWorx
//
//  Created by Brett Vitaz on 11/23/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "MessageRouter.h"
#import "RouterDelegate.h"
#import "Router.h"
#import "PongMessageHandler.h"
#import "PulseWorxRouter.h"
#import "PulseWorxAlertView.h"

@interface MessageRouter() <RouterDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) NSTimer *pingTimer;
@property (strong, nonatomic) PulseWorxAlertView *alert;
- (void)startPingTimer;
- (void)ping;
@end

#pragma mark Constants
static const NSTimeInterval PingDelay = 5.0;

@implementation MessageRouter

#pragma mark Properties
- (void)setRouter:(Router *)newRouter {
    if (_router != nil) {
        [_router stop];
    }
    _router = newRouter;
}

- (PongMessageHandler *)pongHandler {
    if (_isConnected) {
        if (_pongHandler == nil) {
            _pongHandler = [PongMessageHandler create];
        }
        _pongHandler.router = self.router;
    } else {
        _pongHandler = nil;
    }
    return _pongHandler;
}


#pragma mark Memory Management
static MessageRouter *singleInstance;

+ (MessageRouter *)getInstance {
    if (singleInstance == nil) {
        singleInstance = [[MessageRouter alloc] init];
    }
    return singleInstance;
}

- (id)initWithHost:(NSString *)host andPort:(NSUInteger)port {
    if (self = [super init]) {
        /* Stop the old router since it will be replaced */
        [singleInstance.router stop];
        singleInstance.router = nil;
        self.router = [[PulseWorxRouter alloc] initWithHost:host andPort:port];
        [self start];
        /* Put the new router instance in place */
        singleInstance = self;
    }
    return self;
}

- (void)dealloc {
    INVALIDATE_TIMER(self.pingTimer);
    self.alert.delegate = nil;
}

- (void)stop {
    INVALIDATE_TIMER(self.pingTimer);
    
    [self.router stop];
    self.router.delegate = nil;
    self.router = nil;
    
    [self.pongHandler stop];
    self.pongHandler = nil;
    
    self.isConnected = NO;
}

- (void)start {
    if (self.router != nil) {
        self.router.delegate = self;
        [self.router start];
        self.isConnected = YES;
    }
}

#pragma mark RouterDelegate
- (void)routerStarted:(NSString *)hostName {
    NSLog(@"Connection started");
    [[NSNotificationCenter defaultCenter] postNotificationName:CONNECTION_CONNECTED_EVENT object:nil];
}

- (void)routerConnectionFailure:(NSString *)hostName {
    // Connection to this service failed, let's remove to provide other selection options
    if (self.isConnected) {
        [self stop];
        NSLog(@"Connection Failure!");
        [[NSNotificationCenter defaultCenter] postNotificationName:CONNECTION_LOST_EVENT object:nil];
    }
}

- (void)routerTerminated:(NSString *)hostName {
    if (self.isConnected) {
        [self stop];
        NSLog(@"Connection Terminated!");
        [[NSNotificationCenter defaultCenter] postNotificationName:CONNECTION_LOST_EVENT object:nil];
    }
}

- (void)controllerMessage:(NSDictionary *)packet {
    
}

#pragma mark Private methods
- (void)startPingTimer {
    INVALIDATE_TIMER(self.pingTimer);
    self.pingTimer = [NSTimer scheduledTimerWithTimeInterval:PingDelay
                                                      target:self
                                                    selector:@selector(ping)
                                                    userInfo:nil
                                                     repeats:NO];
}

- (void)ping {
    [self.router sendPing];
    if (self.isConnected) {
        [self startPingTimer];
    }
}

@end
