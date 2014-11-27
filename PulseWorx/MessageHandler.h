//
//  MessageHandler.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/23/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PulseWorxRouter.h"

@interface MessageHandler : NSObject

@property (strong, nonatomic) Router *router;

- (void)save:(id)data;

+ (instancetype)create;

@end
