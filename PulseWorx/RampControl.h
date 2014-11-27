//
//  RampControl.h
//  DimmableCell
//
//  Created by Bill Labus on 5/12/14.
//
//

#import <UIKit/UIKit.h>
#import "ControlCell.h"
//#import "ControlCellDelegate.h"
@class RampControl, RampControlScrollView;

@interface RampControl : ControlCell <UIScrollViewDelegate> {
    BOOL _dimming;
    BOOL _brightening;
    BOOL _aboveThreshold;
    RampControlScrollView *_scrollView;
    CAShapeLayer *_leftViewBorderLayer;
    CAShapeLayer *_rightViewBorderLayer;
}

@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIImageView *leftView;
@property (strong, nonatomic) UIImageView *rightView;
@property (strong, nonatomic) UISlider *slider;
@property (readwrite) CGFloat threshold;

- (void)expandControls:(BOOL)expand;

@end
