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
#import "LinkEntity.h"

@implementation PulseWorxTableViewCell
@synthesize entity = _entity;

- (void)awakeFromNib {
    self.rampControl.delegate = self;
}



- (void)setEntity:(PulseWorxEntity *)entity {
    _entity = entity;
    [self.rampControl.button setTitle:_entity.entityName forState:UIControlStateNormal];
}



- (void)rampControlDidTapButton:(RampControl *)rampControl {
    [[PulseWorxController sharedInstance] sendCommand:[[ActivateLinkCommand alloc] initLink:((LinkEntity *)self.entity).linkId forNetwork:1]];
}



- (void)rampControl:(RampControl *)rampControl didBeginAction:(RampControlAction)action {
    NSLog(@"DID BEGIN %@", action == RampControlActionBrighten ? @"BRIGHTENING" : @"DIMMING");
}



- (void)rampControl:(RampControl *)rampControl didEndAction:(RampControlAction)action {
    NSLog(@"DID END %@", action == RampControlActionBrighten ? @"BRIGHTENING" : @"DIMMING");
}

@end
