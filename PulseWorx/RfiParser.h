//
//  RfiParser.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RfiEntity.h"

@interface RfiParser : NSObject

+ (RfiEntity *)parseData:(NSArray *)data;

@end
