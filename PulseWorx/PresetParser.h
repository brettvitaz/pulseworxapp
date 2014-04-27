//
//  PresetParser.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/20/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PresetEntity.h"

@interface PresetParser : NSObject

+ (PresetEntity *)parseData:(NSArray *)data;

@end
