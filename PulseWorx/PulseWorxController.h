//
//  PulseWorxController.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/28/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PulseWorxTransmitCommand.h"
#import "GCDAsyncSocket.h"
#import "PulseWorxSystem.h"

@interface PulseWorxController : NSObject

@property (nonatomic) PulseWorxSystem *pulseWorxSystem;

+ (PulseWorxController *)sharedInstance;

- (BOOL)doConnectToHost:(NSString *)hostName onPort:(UInt16)portNumber;

- (BOOL)doDisconnect;

- (void)sendMessage:(NSData *)message;

- (void)sendCommand:(PulseWorxTransmitCommand *)command;

@end
