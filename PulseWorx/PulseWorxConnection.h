//
//  PulseWorxConnection.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/19/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ConnectionDelegate;

@interface PulseWorxConnection : NSObject

@property (weak, nonatomic) id<ConnectionDelegate> delegate;
@property (copy, nonatomic, readonly) NSString *host;
@property (nonatomic, readonly) NSUInteger port;

- (id)initWithHostAddress:(NSString *)host andPort:(NSUInteger)port;

- (BOOL)connect;

- (void)sendNetworkData:(NSData *)data;

- (void)clean;

@end
