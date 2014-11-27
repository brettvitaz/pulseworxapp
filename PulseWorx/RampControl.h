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

typedef enum {
    RampControlActionDim = 0,
    RampControlActionBrighten = 1
} RampControlAction;

@protocol RampControlDelegate <NSObject>
@optional - (void)rampControlDidTapButton:(RampControl *)rampControl;
@optional - (void)rampControl:(RampControl *)rampControl didBeginAction:(RampControlAction)action;
@optional - (void)rampControl:(RampControl *)rampControl didEndAction:(RampControlAction)action;
@end

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
