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

@property (nonatomic, assign) uint8_t channelNumber;
@property (nonatomic, assign) uint8_t networkId;

@end

@implementation DimmerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

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

- (void)setPulseWorxSystem:(PulseWorxSystem *)pulseWorxSystem {
    _pulseWorxSystem = pulseWorxSystem;
    self.networkId = _pulseWorxSystem.fileRecord.networkId;
}

- (void)setEntity:(ChannelInfoEntity *)entity {
    _entity = entity;
    self.channelNumber = _entity.channelNumber + 1;
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
    [[PulseWorxController sharedInstance] sendCommand:[[FadeStartCommand alloc] initModule:self.entity.moduleId
                                                                                forNetwork:self.networkId
                                                                                forChannel:self.channelNumber
                                                                                 withLevel:kLevelMax
                                                                              withFadeRate:self.entity.fadeRate]];
}

- (IBAction)offButtonPressed:(id)sender {
    [[PulseWorxController sharedInstance] sendCommand:[[FadeStartCommand alloc] initModule:self.entity.moduleId
                                                                                forNetwork:self.networkId
                                                                                forChannel:self.channelNumber
                                                                                 withLevel:kLevelMin
                                                                              withFadeRate:self.entity.fadeRate]];
}

- (IBAction)raiseButtonPressed:(id)sender {
    [[PulseWorxController sharedInstance] sendCommand:[[FadeStartCommand alloc] initModule:self.entity.moduleId
                                                                                forNetwork:self.networkId
                                                                                forChannel:self.channelNumber
                                                                                 withLevel:kLevelMax
                                                                              withFadeRate:FadeRate5]];
}

- (IBAction)raiseButtonReleased:(id)sender {
    [[PulseWorxController sharedInstance] sendCommand:[[FadeStopCommand alloc] initModule:self.entity.moduleId
                                                                               forNetwork:self.networkId
                                                                               forChannel:self.channelNumber]];
}

- (IBAction)lowerButtonPressed:(id)sender {
    [[PulseWorxController sharedInstance] sendCommand:[[FadeStartCommand alloc] initModule:self.entity.moduleId
                                                                                forNetwork:self.networkId
                                                                                forChannel:self.channelNumber
                                                                                 withLevel:kLevelMin
                                                                              withFadeRate:FadeRate5]];
}

- (IBAction)lowerButtonReleased:(id)sender {
    [[PulseWorxController sharedInstance] sendCommand:[[FadeStopCommand alloc] initModule:self.entity.moduleId
                                                                               forNetwork:self.networkId
                                                                               forChannel:self.channelNumber]];
}

- (IBAction)fadeLevelChanged:(UISlider *)sender {
    uint8_t level = kLevelMax * [sender value];
    [[PulseWorxController sharedInstance] sendCommand:[[FadeStartCommand alloc] initModule:self.entity.moduleId
                                                                                forNetwork:self.networkId
                                                                                forChannel:self.channelNumber
                                                                                 withLevel:level
                                                                              withFadeRate:FadeRate2]];
}

@end
