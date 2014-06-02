//
//  ActivateLinkMessage.m
//  PulseWorx
//
//  Created by Brett Vitaz on 5/1/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ActivateLinkCommand.h"

@implementation ActivateLinkCommand

- (id)initModule:(uint8_t)moduleId {
    self = [super initLink:moduleId];
    if (self) {
        
    }
    return self;
}

- (NSData *)getCommand {
    
    const uint8_t commandType[] = { COMMAND_ACTIVATE_LINK };

    return [NSData dataWithBytes:commandType length:sizeof(commandType)];
}

@end
