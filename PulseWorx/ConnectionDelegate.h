//
//  ConnectionDelegate.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/22/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ConnectionDelegate <NSObject>

- (void)connectionConnected:(NSString *)hostName;
- (void)connectionAttemptFailed:(NSString *)hostName;
- (void)connectionTerminated:(NSString *)hostName;
- (void)receivedNetworkPacket:(NSDictionary *)message;

@end
