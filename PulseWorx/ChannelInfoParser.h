//
//  ChannelInfoParser.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/20/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChannelInfoEntity.h"

@interface ChannelInfoParser : NSObject

+ (ChannelInfoEntity *)parseData:(NSArray *)data;

@end
