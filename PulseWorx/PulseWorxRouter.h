//
//  PulseWorxRouter.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/19/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionDelegate.h"
#import "Router.h"

@protocol RouterDelegate;

@interface PulseWorxRouter : Router

- (id)initWithHost:(NSString *)host andPort:(NSUInteger)port;

@end
