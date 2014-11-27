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

@end
