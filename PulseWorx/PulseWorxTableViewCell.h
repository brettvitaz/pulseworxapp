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

@interface PulseWorxTableViewCell : UITableViewCell {
    PulseWorxEntity *_entity;
}

@property (weak, nonatomic) IBOutlet RampControl *rampControl;

- (PulseWorxEntity *)entity;
- (void)setEntity:(PulseWorxEntity *)entity;

@end
