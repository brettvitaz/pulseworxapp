//
//  LinkEntitySet.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/27/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PulseWorxEntitySet.h"

@interface LinkEntitySet : PulseWorxEntitySet <PulseWorxEntitySet>

@property (nonatomic) NSArray *entitySet;

@end
