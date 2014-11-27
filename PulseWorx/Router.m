//
//  Router.m
//  PulseWorx
//
//  Created by Brett Vitaz on 11/23/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "Router.h"

#define NSLOGSTUB NSLog(@"%s", __FUNCTION__)
@implementation Router

- (void)connectionConnected:(NSString *)hostName {
    
}

- (void)connectionAttemptFailed:(NSString *)hostName {
    
}

- (void)connectionTerminated:(NSString *)hostName {
    
}

- (void)receivedNetworkPacket:(NSDictionary *)packet {
    
}

- (BOOL)start {
    NSLOGSTUB;
    return YES;
}

- (void)stop {
    NSLOGSTUB;
}

- (void)sendPing {
    NSLOGSTUB;
}

@end
