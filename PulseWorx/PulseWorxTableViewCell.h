//
//  KeypadTableCellTableViewCell.h
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RampControl.h"
#import "LoadControl.h"

@class PulseWorxEntity;

@interface PulseWorxTableViewCell : UITableViewCell<RampControlDelegate>

@property (nonatomic) PulseWorxEntity *entity;
@property (weak, nonatomic) IBOutlet RampControl *rampControl;
@property (weak, nonatomic) IBOutlet LoadControl *loadControl;
@property (assign, nonatomic) BOOL expanded;

@end
