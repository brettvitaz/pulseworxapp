//
//  ActivateLinkMessage.m
//  PulseWorx
//
//  Created by Brett Vitaz on 5/1/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ActivateLinkCommand.h"
#import "NSData+Conversion.h"

@implementation ActivateLinkCommand

- (NSData *)getCommand {
    
    const char commandType[] = { COMMAND_ACTIVATE_LINK };

    return [NSData dataWithBytes:commandType length:sizeof(commandType)];
}

@end
