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

static const NSTimeInterval kDoubleTapLength = 0.25;

@interface PulseWorxTableViewCell()

@property (nonatomic, assign) BOOL state;

@end

@implementation PulseWorxTableViewCell
@synthesize entity = _entity;

- (void)awakeFromNib {
    self.rampControl.delegate = self;
}



- (void)setEntity:(PulseWorxEntity *)entity {
    _entity = entity;
    [self.rampControl.button setTitle:_entity.entityName forState:UIControlStateNormal];
}


- (void)didTouchButton {
    if ([self.entity isKindOfClass:[ButtonEntity class]]) {
        ((ButtonEntity *)self.entity).singleClickToggleState = !((ButtonEntity *)self.entity).singleClickToggleState;
        if (((ButtonEntity *)self.entity).singleClickToggleState) {
            [[PulseWorxController sharedInstance] sendCommand:[[ActivateLinkCommand alloc] initLink:((ButtonEntity *)self.entity).linkId forNetwork:1]];
        } else {
            [[PulseWorxController sharedInstance] sendCommand:[[DeactivateLinkCommand alloc] initLink:((ButtonEntity *)self.entity).linkId forNetwork:1]];
        }
    } else if ([self.entity isKindOfClass:[LinkEntity class]]) {
        self.state = !self.state;
        if (self.state) {
            [[PulseWorxController sharedInstance] sendCommand:[[ActivateLinkCommand alloc] initLink:((LinkEntity *)self.entity).linkId forNetwork:1]];
        } else {
            [[PulseWorxController sharedInstance] sendCommand:[[DeactivateLinkCommand alloc] initLink:((LinkEntity *)self.entity).linkId forNetwork:1]];
        }
    }
}



- (void)rampControl:(RampControl *)rampControl didBeginAction:(RampControlAction)action {
    NSLog(@"DID BEGIN %@", action == RampControlActionBrighten ? @"BRIGHTENING" : @"DIMMING");
}



- (void)rampControl:(RampControl *)rampControl didEndAction:(RampControlAction)action {
    NSLog(@"DID END %@", action == RampControlActionBrighten ? @"BRIGHTENING" : @"DIMMING");
}

@end
