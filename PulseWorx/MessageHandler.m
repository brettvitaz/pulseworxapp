//
//  MessageHandler.m
//  PulseWorx
//
//  Created by Brett Vitaz on 11/23/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "MessageHandler.h"

@implementation MessageHandler

- (void)save:(NSDictionary *)message {
    // Crude way to emulate "abstract" class
    [self doesNotRecognizeSelector:_cmd];
}

+ (instancetype)create {
    // Crude way to emulate "abstract" class
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end
