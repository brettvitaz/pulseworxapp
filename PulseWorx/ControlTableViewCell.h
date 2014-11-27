//
//  ControlCell.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/24/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ControlCellDelegate.h"
#import "PulseWorxEntity.h"

@interface ControlTableViewCell : UITableViewCell <ControlCellDelegate>

@property (nonatomic) PulseWorxEntity *entity;

@end
