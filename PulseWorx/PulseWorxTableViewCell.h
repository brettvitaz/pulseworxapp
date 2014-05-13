//
//  KeypadTableCellTableViewCell.h
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PulseWorxEntity.h"
#import "RampControl.h"

@interface PulseWorxTableViewCell : UITableViewCell

@property (nonatomic) PulseWorxEntity *entity;
@property (weak, nonatomic) IBOutlet RampControl *dimmableCellView;

@end
