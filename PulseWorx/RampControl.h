//
//  RampControl.h
//  DimmableCell
//
//  Created by Bill Labus on 5/12/14.
//
//

#import <UIKit/UIKit.h>
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

@interface RampControl : UIControl <UIScrollViewDelegate> {
    BOOL _dimming;
    BOOL _brightening;
    BOOL _aboveThreshold;
    RampControlScrollView *_scrollView;
}

@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIImageView *leftView;
@property (strong, nonatomic) UIImageView *rightView;
@property (readwrite) CGFloat threshold;
@property (strong, nonatomic) id<RampControlDelegate> delegate;

@end
