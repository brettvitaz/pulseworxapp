//
//  LoadControl.m
//  PulseWorx
//
//  Created by Bill Labus on 11/13/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "LoadControl.h"
#define SLIDER_PADDING 30

@implementation LoadControl
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = self.tintColor;
        self.clipsToBounds = YES;
        
        _levelColorAdjustmentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _levelColorAdjustmentView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _levelColorAdjustmentView.backgroundColor = [UIColor clearColor];
        [self addSubview:_levelColorAdjustmentView];
        
        _trackView = [[UIView alloc] initWithFrame:CGRectMake(SLIDER_PADDING, self.frame.size.height / 2 - 2, self.frame.size.width - SLIDER_PADDING * 2, 4)];
        _trackView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        _trackView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
        _trackView.layer.cornerRadius = _trackView.frame.size.height / 2;
        [self addSubview:_trackView];
        
        _fillView = [[UIView alloc] initWithFrame:CGRectMake(SLIDER_PADDING, self.frame.size.height / 2 - 2, self.frame.size.width - SLIDER_PADDING * 2, 4)];
        _fillView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        _fillView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
        _fillView.layer.cornerRadius = _fillView.frame.size.height / 2;
        [self addSubview:_fillView];
        
        _handleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _handleView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _handleView.backgroundColor = [UIColor clearColor];
        [self addSubview:_handleView];
        
        _handleFillView = [[UIView alloc] initWithFrame:_handleView.frame];
        _handleFillView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _handleFillView.backgroundColor = [UIColor whiteColor];
        [_handleView addSubview:_handleFillView];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, self.frame.size.height / 2 - 15, self.frame.size.width - 20, 30)];
        self.label.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        self.label.font = [UIFont fontWithName:@"Avenir Next" size:19];
        self.label.textColor = [UIColor colorWithRed:75.0/255.0 green:89.0/255.0 blue:94.0/255.0 alpha:1];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
        
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        [self addGestureRecognizer:_tapGestureRecognizer];
        
        _dragGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        _dragGestureRecognizer.delegate = self;
        //_dragGestureRecognizer.minimumPressDuration = 0.15;
        [self addGestureRecognizer:_dragGestureRecognizer];
    }
    return self;
}



- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self = [self initWithFrame:self.frame];
    }
    return self;
}



- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)recognizer {
    CGPoint velocity = [recognizer velocityInView:self];
    return fabs(velocity.x) > fabs(velocity.y) * 1.5;
}



- (void)handleGesture:(UIGestureRecognizer *)recognizer {
    if (recognizer == _tapGestureRecognizer) {
        CGPoint location = [recognizer locationInView:self];
        CGFloat radius = sqrtf((location.x > self.bounds.size.width / 2 ? powf(location.x, 2) : powf(self.bounds.size.width - location.x, 2)) + powf(self.bounds.size.height, 2));
        UIView *touchView = [[UIView alloc] initWithFrame:CGRectMake(location.x - radius, location.y - radius, radius * 2, radius * 2)];
        touchView.layer.cornerRadius = radius;
        touchView.transform = CGAffineTransformMakeScale(44 / (radius * 2), 44 / (radius * 2));
        touchView.backgroundColor = self.tintColor;
        [self addSubview:touchView];
        [UIView animateWithDuration:0.65 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:kNilOptions animations:^{
            touchView.transform = CGAffineTransformIdentity;
            touchView.alpha = 0;
        } completion:^(BOOL finished) {
            [touchView removeFromSuperview];
        }];
        [self.delegate controlCellDidTapButton:self];
    } else {
        if (recognizer.state == UIGestureRecognizerStateBegan || recognizer.state == UIGestureRecognizerStateChanged) {
            CGPoint clampedLocation = CGPointMake(MIN(MAX([recognizer locationInView:self].x, SLIDER_PADDING), self.bounds.size.width - SLIDER_PADDING), roundf(self.bounds.size.height / 2));
            CGFloat radius = sqrtf((clampedLocation.x > self.bounds.size.width / 2 ? powf(clampedLocation.x, 2) : powf(self.bounds.size.width - clampedLocation.x, 2)) + powf(self.bounds.size.height / 2, 2));
            CGFloat level = (clampedLocation.x - SLIDER_PADDING) / (self.bounds.size.width - SLIDER_PADDING * 2);
            _levelColorAdjustmentView.backgroundColor = [UIColor colorWithWhite:0 alpha:(1 - level) * 0.25];
            
            _fillView.frame = CGRectMake(_fillView.frame.origin.x, _fillView.frame.origin.y, clampedLocation.x - SLIDER_PADDING, _fillView.frame.size.height);
            
            if (recognizer.state == UIGestureRecognizerStateBegan) {
                _handleView.frame = CGRectMake(clampedLocation.x - radius, clampedLocation.y - radius, radius * 2, radius * 2);
                _handleFillView.layer.cornerRadius = radius;
                _handleFillView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
                
                [UIView animateWithDuration:0.35 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:kNilOptions animations:^{
                    _handleFillView.transform = CGAffineTransformMakeScale(15 / radius, 15 / radius);
                    self.label.alpha = 0;
                } completion:nil];
            } else if (recognizer.state == UIGestureRecognizerStateChanged) {
                _handleView.center = clampedLocation;
                float value = (clampedLocation.x - SLIDER_PADDING) / (self.frame.size.width - (SLIDER_PADDING * 2));
//                NSLog(@"Width: %f Location: %f Value: %f", self.frame.size.width, clampedLocation.x, value);
                [self.delegate controlCellDidScroll:self toValue:value];
            }
        } else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
            CGPoint clampedLocation = CGPointMake(MIN(MAX([recognizer locationInView:self].x, SLIDER_PADDING), self.bounds.size.width - SLIDER_PADDING), roundf(self.bounds.size.height / 2));
            CGFloat radius = sqrtf((clampedLocation.x > self.bounds.size.width / 2 ? powf(clampedLocation.x, 2) : powf(self.bounds.size.width - clampedLocation.x, 2)) + powf(self.bounds.size.height / 2, 2));
            
            _handleView.frame = CGRectMake(clampedLocation.x - radius, clampedLocation.y - radius, radius * 2, radius * 2);
            _handleFillView.transform = CGAffineTransformIdentity;
            _handleFillView.frame = CGRectMake(0, 0, radius * 2, radius * 2);
            _handleFillView.layer.cornerRadius = radius;
            _handleFillView.transform = CGAffineTransformMakeScale(15 / radius, 15 / radius);
                
            [UIView animateWithDuration:0.35 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:kNilOptions animations:^{
                _handleFillView.transform = CGAffineTransformIdentity;
                self.label.alpha = 1;
            } completion:^(BOOL finished) {
                _handleView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
                _handleFillView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
                _handleFillView.layer.cornerRadius = 0;
                _handleFillView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
            }];
        }
    }
}

@end
