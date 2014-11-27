//
//  Router.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/23/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionDelegate.h"

@protocol RouterDelegate;

@interface Router : NSObject <ConnectionDelegate>

@property (weak, nonatomic) id<RouterDelegate> delegate;
@property (nonatomic, readonly) NSString *host;

- (BOOL)start;
- (void)stop;
- (void)sendPing;

@end
