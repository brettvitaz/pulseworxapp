//
//  PongMessageHandler.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/23/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "MessageHandler.h"

@interface PongMessageHandler : MessageHandler

@property (strong, nonatomic) NSTimer *warningTimer;
@property (nonatomic) BOOL pingWarningSent;

- (void)startTimer;
- (void)stop;

@end
