//
//  RampControl.h
//  DimmableCell
//
//  Created by Bill Labus on 5/12/14.
//
//

#import <UIKit/UIKit.h>

@interface RampControl : UIControl <UIScrollViewDelegate> 

@property (strong, readwrite) UIButton *button;
@property (strong, readwrite) UIImageView *leftView;
@property (strong, readwrite) UIImageView *rightView;
@property (readwrite) CGFloat threshold;
@property (readwrite) BOOL dimming;
@property (readwrite) BOOL brightening;

@end
