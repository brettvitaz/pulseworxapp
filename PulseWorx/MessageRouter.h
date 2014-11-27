//
//  MessageRouter.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/23/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Router;
@class PongMessageHandler;
//@class PropertyChangeMessageHandler;

@interface MessageRouter : NSObject

@property (strong, nonatomic) Router *router;
@property (copy, nonatomic, readonly) NSString *SID;
@property (strong, nonatomic) PongMessageHandler *pongHandler;
//@property (strong, nonatomic) PropertyChangeMessageHandler *propertyChangeHandler;
@property (nonatomic) BOOL isConnected;

+ (MessageRouter *)getInstance;
- (MessageRouter *)initWithHost:(NSString *)host andPort:(NSUInteger)port;

- (void)start;
- (void)stop;

@end
