//
//  RampControlTableViewCell.m
//  PulseWorx
//
//  Created by Brett Vitaz on 11/24/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "RampControlTableViewCell.h"

@implementation RampControlTableViewCell

@synthesize entity = _entity;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setEntity:(PulseWorxEntity *)entity {
    _entity = entity;
    [self.rampControl.button setTitle:_entity.entityName forState:UIControlStateNormal];
    self.rampControl.delegate = self;
}

@end
