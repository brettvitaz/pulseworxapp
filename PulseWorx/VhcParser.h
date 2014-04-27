//
//  VhcParser.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VhcEntity.h"

@interface VhcParser : NSObject

+ (VhcEntity *)parseData:(NSArray *)data;

@end
