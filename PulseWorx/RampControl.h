//
//  RampControl.h
//  DimmableCell
//
//  Created by Bill Labus on 5/12/14.
//
//

#import <UIKit/UIKit.h>

@protocol RampControlDelegate;

@interface RampControl : UIControl <UIScrollViewDelegate> 

@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *leftView;
@property (strong, nonatomic) UIImageView *rightView;
@property (readwrite) CGFloat threshold;
@property (readwrite) BOOL dimming;
@property (readwrite) BOOL brightening;
@property (strong, nonatomic) id<RampControlDelegate> delegate;

@end

@protocol RampControlDelegate <NSObject>

- (void)rampControl:(RampControl *)rampControl didTouchButton:(UIButton *)button;
- (void)rampControl:(RampControl *)rampControl didStartRamp:(BOOL)rampStarted;
- (void)rampControl:(RampControl *)rampControl didEndRamp:(BOOL)rampEnded;

@end