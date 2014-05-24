//
//  RampControl.m
//  DimmableCell
//
//  Created by Bill Labus on 5/12/14.
//
//

#import "RampControl.h"

@interface RampControl()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign, getter = isAboveThreshold) BOOL aboveThreshold;

@end

@implementation RampControl 

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.threshold = 75;
        self.dimming = NO;
        self.brightening = NO;
        self.aboveThreshold = NO;
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
        self.scrollView.backgroundColor = [UIColor clearColor];
        self.scrollView.delegate = self;
        self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self addSubview:_scrollView];
        
        self.button = [[UIButton alloc] initWithFrame:frame];
        self.button.backgroundColor = [UIColor whiteColor];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [[self.button titleLabel] setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]];
        self.button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//        [self.button addTarget:self action:@selector(didTouchButton) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:self.button];
        
//        self.contentView = [[UIView alloc] initWithFrame:frame];
//        self.contentView.backgroundColor = [UIColor whiteColor];
//        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//        [self.scrollView addSubview:self.contentView];
        
//        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (frame.size.height - 30) / 2, frame.size.width - 20, 30)];
//        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
//        self.titleLabel.font = [UIFont systemFontOfSize:20];
//        self.titleLabel.textColor = [UIColor colorWithRed:115.0/255.0 green:120.0/255.0 blue:122.0/255.0 alpha:1];
//        self.titleLabel.text = @"Kitchen";
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:self.titleLabel];
        
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

- (void)didTouchButton {
    [self.delegate rampControl:self didTouchButton:self.button];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self = [self initWithFrame:self.frame];
    }
    return self;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width + 0.5, self.frame.size.height);
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
    
    self.dimming = fabsf(scrollView.contentOffset.x) >= self.threshold && scrollView.contentOffset.x < 0;
    self.brightening = fabsf(scrollView.contentOffset.x) >= self.threshold && scrollView.contentOffset.x >= 0;
    if (fabsf(scrollView.contentOffset.x) >= self.threshold && !self.isAboveThreshold) { // Above threshold
        self.aboveThreshold = YES;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    } else if (fabsf(scrollView.contentOffset.x) < self.threshold && self.isAboveThreshold) { // Below threshold
        self.aboveThreshold = NO;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

@end
