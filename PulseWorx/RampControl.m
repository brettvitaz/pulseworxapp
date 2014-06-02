//
//  RampControl.m
//  DimmableCell
//
//  Created by Bill Labus on 5/12/14.
//
//

#import "RampControl.h"
#import "RampControlScrollView.h"

@interface RampControl()
@end

@implementation RampControl 

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.threshold = 75;
        _dimming = NO;
        _brightening = NO;
        _aboveThreshold = NO;
        self.backgroundColor = self.tintColor;
        
        _scrollView = [[RampControlScrollView alloc] initWithFrame:frame];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.delegate = self;
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self addSubview:_scrollView];
        
        self.button = [[UIButton alloc] initWithFrame:frame];
        self.button.backgroundColor = [UIColor whiteColor];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [[self.button titleLabel] setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]];
        self.button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.button addTarget:self action:@selector(didTapButton) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:self.button];
        
        self.leftView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (frame.size.height - 37) / 2, 37, 37)];
        self.leftView.image = [UIImage imageNamed:@"icon-dim"];
        self.leftView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:self.leftView];
        [self sendSubviewToBack:self.leftView];
        
        self.rightView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width - 52, (frame.size.height - 37) / 2, 37, 37)];
        self.rightView.image = [UIImage imageNamed:@"icon-brighten"];
        self.rightView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin;
        [self addSubview:self.rightView];
        [self sendSubviewToBack:self.rightView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self = [self initWithFrame:self.frame];
    }
    return self;
}

- (void)didTapButton {
    if ([self.delegate respondsToSelector:@selector(rampControlDidTapButton:)]) {
        [self.delegate rampControlDidTapButton:self];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _scrollView.contentSize = CGSizeMake(self.frame.size.width + 0.5, self.frame.size.height);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    targetContentOffset->x = 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat relative = fabsf(scrollView.contentOffset.x) / self.threshold;
    self.leftView.alpha = relative;
    self.rightView.alpha = relative;
    CGFloat scaleFactor = MIN(relative / 2 + 0.5, 1);
    self.leftView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    self.rightView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    
    if (fabsf(scrollView.contentOffset.x) >= self.threshold && !_aboveThreshold) { // Above threshold
        _dimming = fabsf(scrollView.contentOffset.x) >= self.threshold && scrollView.contentOffset.x < 0;
        _brightening = fabsf(scrollView.contentOffset.x) >= self.threshold && scrollView.contentOffset.x >= 0;
        _aboveThreshold = YES;
        if ([self.delegate respondsToSelector:@selector(rampControl:didBeginAction:)]) {
            if (_dimming) {
                [self.delegate rampControl:self didBeginAction:RampControlActionDim];
            } else if (_brightening) {
                [self.delegate rampControl:self didBeginAction:RampControlActionBrighten];
            }
        }
    } else if (fabsf(scrollView.contentOffset.x) < self.threshold && _aboveThreshold) { // Below threshold
        _aboveThreshold = NO;
        if ([self.delegate respondsToSelector:@selector(rampControl:didEndAction:)]) {
            if (_dimming) {
                [self.delegate rampControl:self didEndAction:RampControlActionDim];
            } else if (_brightening) {
                [self.delegate rampControl:self didEndAction:RampControlActionBrighten];
            }
        }
        _dimming = fabsf(scrollView.contentOffset.x) >= self.threshold && scrollView.contentOffset.x < 0;
        _brightening = fabsf(scrollView.contentOffset.x) >= self.threshold && scrollView.contentOffset.x >= 0;
    }
}

@end
