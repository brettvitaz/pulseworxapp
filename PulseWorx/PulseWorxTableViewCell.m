//
//  KeypadTableCellTableViewCell.m
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxTableViewCell.h"

@implementation PulseWorxTableViewCell
@synthesize entity = _entity;

- (void)awakeFromNib {
    [self.rampControl addTarget:self action:@selector(rampingChanged) forControlEvents:UIControlEventValueChanged];
}



- (void)rampingChanged {
    if (self.rampControl.dimming) {
        // DIMMING
    } else if (self.rampControl.brightening) {
        // BRIGHTENING
    } else {
        // NONE
    }
}



- (void)setEntity:(PulseWorxEntity *)entity {
    _entity = entity;
    [self.rampControl.button setTitle:_entity.entityName forState:UIControlStateNormal];
}

@end
