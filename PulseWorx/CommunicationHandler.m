//
//  CommunicationHandler.m
//  PulseWorx
//
//  Created by Brett Vitaz on 11/23/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "CommunicationHandler.h"
#import "DemoRouter.h"
#import "MessageRouter.h"

#define kDemoMode NO
#define kDefaultPort 2101

@interface CommunicationHandler()
@property (strong, nonatomic) DemoRouter *demoRouter;
- (void)startDemoMode;
- (void)startFixedAddressCommunication;
- (void)connectionLost:(NSNotification *)note;
- (void)connectionError:(NSNotification *)note;
- (void)pingInterrupted:(NSNotification *)note;
- (void)pingRestored:(NSNotification *)note;

@end

@implementation CommunicationHandler

#pragma mark Public methods
- (void)start {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(connectionLost:)
                                                 name:CONNECTION_LOST_EVENT
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(pingInterrupted:)
                                                 name:PING_INTERRUPTED
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(pingRestored:)
                                                 name:PING_RESTORED
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(connectionError:)
                                                 name:CONNECTION_ERROR_EVENT
                                               object:nil];
    NSLog(@"Start communication");
    if (kDemoMode) {
        [self startDemoMode];
    } else {
        [self startFixedAddressCommunication];
    }
}

- (void)stop {
    NSLog(@"Stop communication");
    [[MessageRouter getInstance] stop];
    self.messageRouter = nil;
    self.demoRouter = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CONNECTION_LOST_EVENT object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CONNECTION_CONNECTED_EVENT object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:PING_INTERRUPTED object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:PING_RESTORED object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CONNECTION_ERROR_EVENT object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:CONNECTION_LOST_EVENT object:nil];
}

#pragma mark Private methods
- (void)startDemoMode {
    
}

- (void)startFixedAddressCommunication {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSArray *locations = [prefs arrayForKey:SETTINGS_CONNECTION_LOCATIONS];
    NSInteger curLocIndex = [prefs integerForKey:SETTINGS_CONNECTION_CURRENT_LOCATION];
    NSDictionary *curLocation = (curLocIndex == NSNotFound) ? nil : locations[curLocIndex];
    if (curLocation == nil) {
        // ask for location
    } else {
        // connect
    }
}

- (void)connectionLost:(NSNotification *)note {
    
}

- (void)pingInterrupted:(NSNotification *)note {
    
}

- (void)pingRestored:(NSNotification *)note {
    
}

- (void)connectionError:(NSNotification *)note {
    
}

@end
