//
//  KeypadTableCellTableViewCell.m
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxTableViewCell.h"
#import "PulseWorxController.h"
#import "ActivateLinkCommand.h"
#import "DeactivateLinkCommand.h"
#import "ButtonEntity.h"
#import "LinkEntity.h"
#import "FadeStartCommand.h"
#import "FadeStopCommand.h"

static const NSTimeInterval kDoubleTapLength = 0.25;

@interface PulseWorxTableViewCell()

@property (nonatomic, assign) BOOL state;

@end

@implementation PulseWorxTableViewCell
@synthesize entity = _entity;
@synthesize expanded = _expanded;

-(void)setExpanded:(BOOL)expanded {
    [self.rampControl expandControls:expanded];
}

- (void)awakeFromNib {
    self.rampControl.delegate = self;
}

- (void)setEntity:(PulseWorxEntity *)entity {
    _entity = entity;
    [self.rampControl.button setTitle:_entity.entityName forState:UIControlStateNormal];
    self.loadControl.label.text = _entity.entityName;
}

@end
