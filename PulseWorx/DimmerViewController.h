//
//  DimmerViewController.h
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PulseWorxSystem;
@class ChannelInfoEntity;

@interface DimmerViewController : UIViewController

@property (nonatomic) PulseWorxSystem *pulseWorxSystem;
@property (nonatomic) ChannelInfoEntity *entity;

@property (weak, nonatomic) IBOutlet UIButton *onButton;
@property (weak, nonatomic) IBOutlet UIButton *offButton;
@property (weak, nonatomic) IBOutlet UIButton *raiseButton;
@property (weak, nonatomic) IBOutlet UIButton *lowerButton;
@property (weak, nonatomic) IBOutlet UISlider *fadeSlider;
- (IBAction)onButtonPressed:(id)sender;
- (IBAction)offButtonPressed:(id)sender;
- (IBAction)raiseButtonPressed:(id)sender;
- (IBAction)raiseButtonReleased:(id)sender;
- (IBAction)lowerButtonPressed:(id)sender;
- (IBAction)lowerButtonReleased:(id)sender;
- (IBAction)fadeLevelChanged:(UISlider *)sender;


@end
