//
//  RouterDelegate.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/23/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RouterDelegate <NSObject>

- (void)routerStarted:(NSString *)hostName;
- (void)routerTerminated:(NSString *)hostName;
- (void)routerConnectionFailure:(NSString *)hostName;
- (void)controllerMessage:(NSDictionary *)packet;

@end

