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
}

#pragma mark - RampControlDelegate

- (void)rampControlDidTapButton:(RampControl *)rampControl {
    if ([self.entity isKindOfClass:[ButtonEntity class]]) {
        ((ButtonEntity *)self.entity).currentSingleClickToggleState = !((ButtonEntity *)self.entity).currentSingleClickToggleState;
        self.state = ((ButtonEntity *)self.entity).currentSingleClickToggleState;
    } else {
        self.state = !self.state;
    }

    if (self.state) {
        [[PulseWorxController sharedInstance] sendCommand:[[ActivateLinkCommand alloc] initLink:self.entity.getActionId]];
    } else {
        [[PulseWorxController sharedInstance] sendCommand:[[DeactivateLinkCommand alloc] initLink:self.entity.getActionId]];
    }

}

- (void)rampControl:(RampControl *)rampControl didBeginAction:(RampControlAction)action {
    NSLog(@"DID BEGIN %@", action == RampControlActionBrighten ? @"BRIGHTENING" : @"DIMMING");
    switch (action) {
        case RampControlActionBrighten:
            [[PulseWorxController sharedInstance] sendCommand:[[FadeStartCommand alloc] initLink:self.entity.getActionId
                                                                                       withLevel:kLevelMax
                                                                                    withFadeRate:PWFadeRate5]];
            break;
        case RampControlActionDim:
            [[PulseWorxController sharedInstance] sendCommand:[[FadeStartCommand alloc] initLink:self.entity.getActionId
                                                                                       withLevel:kLevelMin
                                                                                    withFadeRate:PWFadeRate5]];
        default:
            break;
    }

}

- (void)rampControl:(RampControl *)rampControl didEndAction:(RampControlAction)action {
    NSLog(@"DID END %@", action == RampControlActionBrighten ? @"BRIGHTENING" : @"DIMMING");
    [[PulseWorxController sharedInstance] sendCommand:[[FadeStopCommand alloc] initLink:self.entity.getActionId]];
}

@end
