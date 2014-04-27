//
//  LinkParser.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/16/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkEntity.h"

@interface LinkParser : NSObject

+ (LinkEntity *)parseData:(NSArray *)data;

@end
