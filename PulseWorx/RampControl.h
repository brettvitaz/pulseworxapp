//
//  RampControl.h
//  DimmableCell
//
//  Created by Bill Labus on 5/12/14.
//
//

#import <UIKit/UIKit.h>

@interface RampControl : UIView <UIScrollViewDelegate> {
    UIScrollView *_scrollView;
}

@property (strong, readwrite) UIButton *button;
@property (strong, readwrite) UIImageView *leftView;
@property (strong, readwrite) UIImageView *rightView;
@property (readwrite) CGFloat threshold;

@end
