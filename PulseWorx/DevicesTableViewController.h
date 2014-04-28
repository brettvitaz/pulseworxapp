//
//  DevicesTableViewController.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/27/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PulseWorxSystem;

@interface DevicesTableViewController : UITableViewController

@property (nonatomic) PulseWorxSystem *pulseWorxSystem;
@property (nonatomic) NSString *roomName;

@end
