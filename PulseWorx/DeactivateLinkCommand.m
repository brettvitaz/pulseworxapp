//
//  DeactivateLinkCommand.m
//  PulseWorx
//
//  Created by Brett Vitaz on 5/15/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "DeactivateLinkCommand.h"

@implementation DeactivateLinkCommand

- (id)initModule:(uint8_t)moduleId forNetwork:(uint8_t)networkId {
    self = [super initLink:moduleId forNetwork:networkId];
    if (self) {
        
    }
    return self;
}

- (NSData *)getCommand {
    
    const uint8_t commandType[] = { COMMAND_DEACTIVATE_LINK };
    
    return [NSData dataWithBytes:commandType length:sizeof(commandType)];
}

@end
