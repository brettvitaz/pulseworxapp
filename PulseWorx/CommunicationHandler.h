//
//  CommunicationHandler.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/23/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MessageRouter;

@interface CommunicationHandler : NSObject

@property (strong, nonatomic) MessageRouter *messageRouter;

- (void)start;
- (void)stop;

@end
