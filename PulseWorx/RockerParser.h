//
//  RockerParser.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RockerEntity.h"

@interface RockerParser : NSObject

+ (RockerEntity *)parseData:(NSArray *)data;

@end
