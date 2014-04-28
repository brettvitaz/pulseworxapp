//
//  KeypadTableViewController.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/27/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PulseWorxSystem.h"

@class ModuleEntity;

@interface KeypadTableViewController : UITableViewController

@property (nonatomic) PulseWorxSystem *pulseWorxSystem;
@property (nonatomic) ModuleEntity *module;

@end
