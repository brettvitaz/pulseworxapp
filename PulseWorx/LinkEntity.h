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

@property (nonatomic, assign) uint8_t linkId;
@property (nonatomic) NSString *linkName;

@property (nonatomic, assign, getter = isActivated) BOOL activated;

@end
