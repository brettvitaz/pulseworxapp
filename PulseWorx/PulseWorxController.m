//
//  PulseWorxController.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/28/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxController.h"
#import "PulseWorxMessageConstants.h"
#import "ActivateLinkCommand.h"

@interface PulseWorxController() <GCDAsyncSocketDelegate>

@property (nonatomic, strong) GCDAsyncSocket *socket;

@end

@implementation PulseWorxController

+ (PulseWorxController *)sharedInstance {
    static dispatch_once_t  onceToken;
    static PulseWorxController *sSharedInstance;
    
    dispatch_once(&onceToken, ^{
        sSharedInstance = [[PulseWorxController alloc] init];
    });
    return sSharedInstance;
}

- (BOOL)doConnectToHost:(NSString *)hostName onPort:(UInt16)portNumber {
    NSError *error = nil;
    [self setSocket:[[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()]];
    if (![[self socket] connectToHost:hostName onPort:portNumber error:&error]) {
        NSLog(@"I goofed: %@", error);
    }

    return YES;
}

- (BOOL)doDisconnect {
    [[self socket] disconnectAfterReadingAndWriting];
    return YES;
}

- (void)sendMessage:(NSData *)message {
    [[self socket] writeData:message withTimeout:-1 tag:1];
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    NSLog(@"Connected to %@ on port %u", host, port);
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    NSLog(@"Disconnected with error %@", err);
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSLog(@"Received data %@",data);
}

- (void)activateLink:(NSNumber *)linkId forNetwork:(NSNumber *)networkId {
    ActivateLinkCommand *command = [[ActivateLinkCommand alloc] initWithId:[linkId integerValue] forNetwork:[networkId integerValue]];
    NSData *message = [command getData];
    NSLog(@"%@", message);
    [self sendMessage:message];
}

@end
