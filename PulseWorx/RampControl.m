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
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.threshold = 75;
        _dimming = NO;
        _brightening = NO;
        _aboveThreshold = NO;
        self.backgroundColor = self.tintColor;
        
        _scrollView = [[RampControlScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 70)];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.delegate = self;
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:_scrollView];
        
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 70)];
        self.button.backgroundColor = [UIColor whiteColor];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [[self.button titleLabel] setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]];
        self.button.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.button addTarget:self action:@selector(didTapButton) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:self.button];
        
        self.leftView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 19, 37, 37)];
        self.leftView.image = [UIImage imageNamed:@"icon-dim"];
        self.leftView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleRightMargin;
        _leftViewBorderLayer = [CAShapeLayer layer];
        _leftViewBorderLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.leftView.bounds].CGPath;
        _leftViewBorderLayer.fillColor = [UIColor clearColor].CGColor;
        _leftViewBorderLayer.strokeColor = [UIColor whiteColor].CGColor;
        _leftViewBorderLayer.lineWidth = 2;
        _leftViewBorderLayer.strokeStart = 0;
        _leftViewBorderLayer.strokeEnd = 0;
        _leftViewBorderLayer.lineCap = kCALineCapRound;
        _leftViewBorderLayer.transform = CATransform3DMakeRotation(-M_PI / 2, 0.0, 0.0, 1.0);
        [self.leftView.layer addSublayer:_leftViewBorderLayer];
        _leftViewBorderLayer.position = CGPointMake(0, self.leftView.bounds.size.height);
        [self addSubview:self.leftView];
        [self sendSubviewToBack:self.leftView];
        
        self.rightView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width - 37 - 12, 19, 37, 37)];
        self.rightView.image = [UIImage imageNamed:@"icon-brighten"];
        self.rightView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin;
        _rightViewBorderLayer = [CAShapeLayer layer];
        _rightViewBorderLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.leftView.bounds].CGPath;
        _rightViewBorderLayer.fillColor = [UIColor clearColor].CGColor;
        _rightViewBorderLayer.strokeColor = [UIColor whiteColor].CGColor;
        _rightViewBorderLayer.lineWidth = 2;
        _rightViewBorderLayer.strokeStart = 0;
        _rightViewBorderLayer.strokeEnd = 0;
        _rightViewBorderLayer.lineCap = kCALineCapRound;
        _rightViewBorderLayer.transform = CATransform3DMakeRotation(-M_PI / 2, 0.0, 0.0, 1.0);
        [self.rightView.layer addSublayer:_rightViewBorderLayer];
        _rightViewBorderLayer.position = CGPointMake(0, self.rightView.bounds.size.height);
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
    if ([self.delegate respondsToSelector:@selector(controlCellDidTapButton:)]) {
        [self.delegate controlCellDidTapButton:self];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _scrollView.contentSize = CGSizeMake(self.frame.size.width + 0.5, _scrollView.bounds.size.height);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    targetContentOffset->x = 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {    
    CGFloat relative = fabsf(scrollView.contentOffset.x) / self.threshold;
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    _leftViewBorderLayer.strokeEnd = relative;
    _rightViewBorderLayer.strokeEnd = relative;
    [CATransaction commit];
    _leftViewBorderLayer.strokeColor = relative < 1 ? [UIColor colorWithWhite:1 alpha:0.5].CGColor : [UIColor colorWithWhite:1 alpha:1].CGColor;
    _rightViewBorderLayer.strokeColor = relative < 1 ? [UIColor colorWithWhite:1 alpha:0.5].CGColor : [UIColor colorWithWhite:1 alpha:1].CGColor;
    
    if (fabsf(scrollView.contentOffset.x) >= self.threshold && !_aboveThreshold) { // Above threshold
        _dimming = fabsf(scrollView.contentOffset.x) >= self.threshold && scrollView.contentOffset.x < 0;
        _brightening = fabsf(scrollView.contentOffset.x) >= self.threshold && scrollView.contentOffset.x >= 0;
        _aboveThreshold = YES;
        if ([self.delegate respondsToSelector:@selector(controlCell:didBeginAction:)]) {
            if (_dimming) {
                [self.delegate controlCell:self didBeginAction:ControlActionDim];
            } else if (_brightening) {
                [self.delegate controlCell:self didBeginAction:ControlActionBrighten];
            }
        }
    } else if (fabsf(scrollView.contentOffset.x) < self.threshold && _aboveThreshold) { // Below threshold
        _aboveThreshold = NO;
        if ([self.delegate respondsToSelector:@selector(controlCell:didEndAction:)]) {
            if (_dimming) {
                [self.delegate controlCell:self didEndAction:ControlActionDim];
            } else if (_brightening) {
                [self.delegate controlCell:self didEndAction:ControlActionBrighten];
            }
        }
        _dimming = fabsf(scrollView.contentOffset.x) >= self.threshold && scrollView.contentOffset.x < 0;
        _brightening = fabsf(scrollView.contentOffset.x) >= self.threshold && scrollView.contentOffset.x >= 0;
    }
}

- (void)expandControls:(BOOL)expand {
    if (expand) {
        self.slider = [[UISlider alloc] initWithFrame:CGRectMake(6, 80, 308, 31)];
        [self.slider setMinimumTrackTintColor:[UIColor whiteColor]];
        [self addSubview:self.slider];
    }
}

@end
