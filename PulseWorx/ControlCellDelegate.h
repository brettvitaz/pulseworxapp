//
//  ControlCellDelegate.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/24/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ControlCell.h"
@class ControlCell;

typedef enum {
    ControlActionDim = 0,
    ControlActionBrighten = 1
} ControlAction;

@protocol ControlCellDelegate <NSObject>

@optional - (void)controlCellDidTapButton:(ControlCell *)controlCell;
@optional - (void)controlCell:(ControlCell *)controlCell didBeginAction:(ControlAction)action;
@optional - (void)controlCell:(ControlCell *)controlCell didEndAction:(ControlAction)action;
@optional - (void)controlCellDidScroll:(ControlCell *)controlCell toValue:(float)value;

@end