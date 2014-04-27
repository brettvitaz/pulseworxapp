//
//  ModuleParser.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/16/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModuleEntity.h"

@interface ModuleParser : NSObject

+ (ModuleEntity *)parseData:(NSArray *)data;

@end
