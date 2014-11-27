//
//  LoadControl.h
//  PulseWorx
//
//  Created by Bill Labus on 11/13/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlCell.h"
//#import "ControlCellDelegate.h"

@interface LoadControl : ControlCell <UIGestureRecognizerDelegate> {
    UIView *_levelColorAdjustmentView;
    UIView *_trackView;
    UIView *_fillView;
    UIView *_handleView;
    UIView *_handleFillView;
    UIPanGestureRecognizer *_dragGestureRecognizer;
    UITapGestureRecognizer *_tapGestureRecognizer;
}

@property (strong, readwrite) UILabel *label;

@end
