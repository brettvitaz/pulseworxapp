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
    [self.rampControl addTarget:self action:@selector(rampingChanged) forControlEvents:UIControlEventValueChanged];
    [self.rampControl.button addTarget:self action:@selector(didTouchButton) forControlEvents:UIControlEventTouchUpInside];
    self.rampControl.delegate = self;
}

- (void)setEntity:(PulseWorxEntity *)entity {
    _entity = entity;
    [self.rampControl.button setTitle:_entity.entityName forState:UIControlStateNormal];
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

- (void)didTouchButton {
    [[PulseWorxController sharedInstance] sendCommand:[[ActivateLinkCommand alloc] initLink:((LinkEntity *)self.entity).linkId forNetwork:1]];
}

- (void)rampControl:(RampControl *)rampControl didTouchButton:(UIButton *)button {
    NSLog(@"%@ %@", rampControl, button);
}

- (void)rampControl:(RampControl *)rampControl didStartRamp:(BOOL)rampStarted {
    
}

- (void)rampControl:(RampControl *)rampControl didEndRamp:(BOOL)rampEnded {
    
}

@end
