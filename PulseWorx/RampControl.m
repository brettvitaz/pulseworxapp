//
//  RampControl.m
//  DimmableCell
//
//  Created by Bill Labus on 5/12/14.
//
//

#import "RampControl.h"

@implementation RampControl

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.threshold = 75;
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.delegate = self;
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self addSubview:_scrollView];
        
        self.contentView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.contentView.backgroundColor = [UIColor grayColor];
        self.contentView.titleLabel.textColor = [UIColor colorWithRed:115.0/255.0 green:120.0/255.0 blue:122.0/255.0 alpha:1];
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [_scrollView addSubview:self.contentView];
        
//        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (self.frame.size.height - 30) / 2, self.frame.size.width - 20, 30)];
//        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
//        self.titleLabel.font = [UIFont systemFontOfSize:20];
//        self.titleLabel.textColor = [UIColor colorWithRed:115.0/255.0 green:120.0/255.0 blue:122.0/255.0 alpha:1];
//        self.titleLabel.text = @"Kitchen";
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:self.titleLabel];
        
        self.leftView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (self.frame.size.height - 37) / 2, 37, 37)];
        self.leftView.image = [UIImage imageNamed:@"icon-dim"];
        self.leftView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:self.leftView];
        [self sendSubviewToBack:self.leftView];
        
        self.rightView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 52, (self.frame.size.height - 37) / 2, 37, 37)];
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
}

@end
