//
//  DimmerTableViewController.h
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PulseWorxSystem.h"

@class ChannelInfoEntity;

@interface DimmerTableViewController : UITableViewController

@property (nonatomic) PulseWorxSystem *pulseWorxSystem;
@property (nonatomic) ChannelInfoEntity *entity;

@end
