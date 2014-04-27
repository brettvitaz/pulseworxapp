//
//  PulseWorxSystemParser.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/14/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PulseWorxSystem;

@interface PulseWorxSystemParser : NSObject

@property (nonatomic, readonly) PulseWorxSystem *pulseworxSystem;

- (id)initWithData:(NSArray *)data;

@end
