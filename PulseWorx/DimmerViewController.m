//
//  DimmerViewController.m
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "DimmerViewController.h"
#import "PulseWorxController.h"
#import "FadeStartCommand.h"
#import "FadeStopCommand.h"
#import "ChannelInfoEntity.h"
#import "PulseWorxSystem.h"

@interface DimmerViewController ()

@end

@implementation DimmerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onButtonPressed:(id)sender {
    [[PulseWorxController sharedInstance] sendMessage:[[[FadeStartCommand alloc] initWithId:[[self entity] moduleId] forNetwork:[[[self pulseWorxSystem] fileRecord] networkId] forChannel:[[self entity] channelNumber] withLevel:LEVEL_MAX withFadeRate:[[self entity] fadeRate]] getData]];
}

- (IBAction)offButtonPressed:(id)sender {
    [[PulseWorxController sharedInstance] sendMessage:[[[FadeStartCommand alloc] initWithId:[[self entity] moduleId] forNetwork:[[[self pulseWorxSystem] fileRecord] networkId] forChannel:[[self entity] channelNumber] withLevel:LEVEL_MIN withFadeRate:[[self entity] fadeRate]] getData]];
}

- (IBAction)raiseButtonPressed:(id)sender {
    [[PulseWorxController sharedInstance] sendMessage:[[[FadeStartCommand alloc] initWithId:[[self entity] moduleId] forNetwork:[[[self pulseWorxSystem] fileRecord] networkId] forChannel:[[self entity] channelNumber] withLevel:LEVEL_MAX withFadeRate:RATE_5] getData]];
}

- (IBAction)raiseButtonReleased:(id)sender {
    [[PulseWorxController sharedInstance] sendMessage:[[[FadeStopCommand alloc] initWithId:[[self entity] moduleId] forNetwork:[[[self pulseWorxSystem] fileRecord] networkId] forChannel:[[self entity] channelNumber]] getData]];
}

- (IBAction)lowerButtonPressed:(id)sender {
    [[PulseWorxController sharedInstance] sendMessage:[[[FadeStartCommand alloc] initWithId:[[self entity] moduleId] forNetwork:[[[self pulseWorxSystem] fileRecord] networkId] forChannel:[[self entity] channelNumber] withLevel:LEVEL_MIN withFadeRate:RATE_5] getData]];
}

- (IBAction)lowerButtonReleased:(id)sender {
    [[PulseWorxController sharedInstance] sendMessage:[[[FadeStopCommand alloc] initWithId:[[self entity] moduleId] forNetwork:[[[self pulseWorxSystem] fileRecord] networkId] forChannel:[[self entity] channelNumber]] getData]];
}

- (IBAction)fadeLevelChanged:(UISlider *)sender {
    uint8_t level = LEVEL_MAX * [sender value];
    [[PulseWorxController sharedInstance] sendMessage:[[[FadeStartCommand alloc] initWithId:[[self entity] moduleId] forNetwork:[[[self pulseWorxSystem] fileRecord] networkId] forChannel:[[self entity] channelNumber] withLevel:level withFadeRate:RATE_2] getData]];
}

@end
