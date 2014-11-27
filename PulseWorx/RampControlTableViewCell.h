//
//  RampControlTableViewCell.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/24/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlTableViewCell.h"
#import "RampControl.h"

@interface RampControlTableViewCell : ControlTableViewCell <RampControlDelegate>

@property (weak, nonatomic) IBOutlet RampControl *rampControl;

@end
