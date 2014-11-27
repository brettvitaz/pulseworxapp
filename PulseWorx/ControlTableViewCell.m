//
//  ControlCell.m
//  PulseWorx
//
//  Created by Brett Vitaz on 11/24/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ControlTableViewCell.h"

@implementation ControlTableViewCell

- (void)controlCellDidTapButton:(ControlCell *)controlCell {
    NSLog(@"TapButton");
}

- (void)controlCell:(ControlCell *)controlCell didBeginAction:(ControlAction)action {
    NSLog(@"BeginAction: %i", action);
}

- (void)controlCell:(ControlCell *)controlCell didEndAction:(ControlAction)action {
    NSLog(@"EndAction: %i", action);
}

- (void)controlCellDidScroll:(ControlCell *)controlCell toValue:(float)value {
    NSLog(@"Scroll: %f", value);
}



#pragma mark - RampControlDelegate
/*
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
*/

@end
