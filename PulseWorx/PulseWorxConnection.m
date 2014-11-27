//
//  PulseWorxConnection.m
//  PulseWorx
//
//  Created by Brett Vitaz on 11/19/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxConnection.h"
#import "GCDAsyncSocket.h"
#import "ConnectionDelegate.h"

#define kWriteDataTag 1
#define kReadDataTag 11
#define kWriteDataTimeout 5.0

@interface PulseWorxConnection () <GCDAsyncSocketDelegate>
@property (strong, nonatomic) GCDAsyncSocket *socket;
@property (copy, nonatomic, readwrite) NSString *host;
@property (nonatomic, readwrite) NSUInteger port;
@end

@implementation PulseWorxConnection

- (id)initWithHostAddress:(NSString *)host andPort:(NSUInteger)port {
    if (self = [super init]) {
        self.host = host;
        self.port = port;
        self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    return self;
}

- (void)dealloc {
    [self.socket setDelegate:nil delegateQueue:NULL];
    [self.socket disconnect];
    self.socket = nil;
}

- (BOOL)connect {
    BOOL success = NO;
    if (self.host != nil) {
        NSError *err = nil;
        if ([self.socket connectToHost:self.host onPort:self.port error:&err]) {
            success = YES;
        } else {
            NSLog(@"Connection failed: %@", err);
            [self.delegate connectionAttemptFailed:self.host];
        }
        
    }
    return success;
}

- (void)sendNetworkData:(NSData *)data {
    [self.socket writeData:data withTimeout:kWriteDataTimeout tag:kWriteDataTag];
    
}

- (void)clean {
    self.host = nil;
    self.port = 0;
    if (self.socket != nil) {
        [self.socket setDelegate:nil delegateQueue:NULL];
        [self.socket disconnect];
        self.socket = nil;
    }
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    NSLog(@"Connected to host %@ on port %i", host, port);
    [self.socket readDataToData:[GCDAsyncSocket CRData] withTimeout:-1 tag:kReadDataTag];
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
    if (tag != kWriteDataTag) {
        NSLog(@"Unknown tag: %li", tag);
    }
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    [self.socket readDataToData:[GCDAsyncSocket CRData] withTimeout:-1 tag:kReadDataTag];
    NSString *message = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSASCIIStringEncoding];
    NSLog(@"Received bytes %@", message);
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    NSLog(@"Connection to %@ on port %i failed", self.host, (int)self.port);
    [self.delegate connectionAttemptFailed:self.host];
}

@end
