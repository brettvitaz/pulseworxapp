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

- (id)init {
    self = [super init];
    if (self) {
        self.socket = [[GCDAsyncSocket alloc] init];
    }
    return self;
}

- (BOOL)doConnectToHost:(NSString *)hostName onPort:(UInt16)portNumber {
    NSError *error = nil;
    [self.socket setDelegate:self delegateQueue:dispatch_get_main_queue()];
    if (![self.socket connectToHost:hostName onPort:portNumber error:&error]) {
        NSLog(@"I goofed: %@", error);
    }

    return YES;
}

- (BOOL)doDisconnect {
    [self.socket setDelegate:nil];
    [self.socket disconnect];
    return YES;
}

- (void)sendMessage:(NSData *)message {
    [self.socket writeData:message withTimeout:-1 tag:1];
}

- (void)sendCommand:(PulseWorxCommand *)command {
    [self sendMessage:[command getData]];
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    NSLog(@"Connected to %@ on port %u.", host, port);
    [self.socket readDataToData:[GCDAsyncSocket CRData] withTimeout:-1 tag:1];
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    NSLog(@"Disconnected (with error: %@)", err);
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSLog(@"Received data %@", data);
//    const char *message = [data bytes];
    NSString *message = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSASCIIStringEncoding];
    NSLog(@"Received bytes %@", message);
    [self hexToBytes:message];
    [self.socket readDataToData:[GCDAsyncSocket CRData] withTimeout:-1 tag:1];
}

- (char *)hexToBytes:(NSString *)hexMessage {
    char *byteMessage;
    if ([hexMessage rangeOfString:@"^P\\w.*" options:NSRegularExpressionSearch].location != NSNotFound) {
        NSLog(@"Found P");
    }
//    strtol(<#const char *#>, <#char **#>, <#int#>)
    
    return byteMessage;
}

@end
