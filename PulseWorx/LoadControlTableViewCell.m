//
//  LoadControlTableViewCell.m
//  PulseWorx
//
//  Created by Brett Vitaz on 11/24/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "LoadControlTableViewCell.h"

@implementation LoadControlTableViewCell

@synthesize entity = _entity;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setEntity:(PulseWorxEntity *)entity {
    _entity = entity;
    self.loadControl.label.text = _entity.entityName;
    self.loadControl.delegate = self;
}

@end
