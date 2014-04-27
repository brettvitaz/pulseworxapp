//
//  LinkEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/16/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

@interface LinkEntity : PulseWorxEntity

/*
 • Link Id#
 • Link Name
 */

@property (nonatomic) NSUInteger linkId;
@property (nonatomic) NSString *linkName;

@end
