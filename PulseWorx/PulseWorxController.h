//
//  PulseWorxController.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/28/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PulseWorxCommand.h"
#import "GCDAsyncSocket.h"

@interface PulseWorxController : NSObject

+ (PulseWorxController *)sharedInstance;

- (BOOL)doConnectToHost:(NSString *)hostName onPort:(UInt16)portNumber;

- (BOOL)doDisconnect;

- (void)sendMessage:(NSData *)message;

- (void)sendCommand:(PulseWorxCommand *)command;

- (void)activateLink:(NSNumber *)linkId forNetwork:(NSNumber *)networkId;

@end
