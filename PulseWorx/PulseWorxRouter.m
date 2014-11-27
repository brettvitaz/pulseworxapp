//
//  PulseWorxRouter.m
//  PulseWorx
//
//  Created by Brett Vitaz on 11/19/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxRouter.h"
#import "RouterDelegate.h"
#import "PulseWorxConnection.h"

@interface PulseWorxRouter()
@property (strong, nonatomic) PulseWorxConnection *connection;
@end

@implementation PulseWorxRouter

- (NSString *)host {
    NSString *host = nil;
    if (self.connection != nil) {
        host = self.connection.host;
    }
    return host;
}

- (id)initWithHost:(NSString *)host andPort:(NSUInteger)port {
    if (self = [super init]) {
        self.connection = [[PulseWorxConnection alloc] initWithHostAddress:host andPort:port];
    }
    return self;
}

- (void)connectionConnected:(NSString *)hostName {
//    [self sendHelloMessage];
    // start ping
    [self.delegate routerStarted:hostName];
}

- (void)connectionAttemptFailed:(NSString *)hostName {
    [self.delegate routerConnectionFailure:hostName];
}

- (void)connectionTerminated:(NSString *)hostName {
    [self.delegate routerTerminated:hostName];
}

- (void)receivedNetworkPacket:(NSDictionary *)packet {
    if ([packet isKindOfClass:[NSDictionary class]]) {
        [self.delegate controllerMessage:packet];
    }
}

- (BOOL)start {
    BOOL success = NO;
    if (self.connection != nil) {
        self.connection.delegate = self;
        // start ping
        success = [self.connection connect];
    }
    return success;
}

- (void)stop {
    if (self.connection != nil) {
        [self.connection clean];
        self.connection.delegate = nil;
        self.connection = nil;
    }
}

- (void)sendPing {
    // TODO: send ping
    [self.connection sendNetworkData:nil];
}

@end
