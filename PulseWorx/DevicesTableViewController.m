//
//  DevicesTableViewController.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/27/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "DevicesTableViewController.h"
#import "PulseWorxSystem.h"
#import "ModuleEntity.h"
#import "KeypadTableViewController.h"
#import "PulseWorxTableViewCell.h"

@interface DevicesTableViewController ()

@property (nonatomic) NSArray *deviceList;

@end

@implementation DevicesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.deviceList = [[self pulseWorxSystem] getDevicesForRoom:[self roomName]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self deviceList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PulseWorxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Item" forIndexPath:indexPath];
    
    ModuleEntity *device = [[self deviceList] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[device deviceName]];
    
    cell.entity = device;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *segueIdentifier;
    ModuleEntity *entity = (ModuleEntity *)[((PulseWorxTableViewCell *)[tableView cellForRowAtIndexPath:indexPath]) entity];
    if ([entity kind] == ModuleKindKeypad) {
        segueIdentifier = @"KeypadNavigationSegue";
    } else {
        segueIdentifier = @"SwitchNavigationSegue";
    }
    [self performSegueWithIdentifier:segueIdentifier sender:entity];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([@"KeypadNavigationSegue" isEqual:[segue identifier]]) {
    } else if ([@"SwitchNavigationSegue" isEqual:[segue identifier]]) {
    }
    
    KeypadTableViewController *controller = (KeypadTableViewController *) [segue destinationViewController];
    controller.pulseWorxSystem = [self pulseWorxSystem];
    controller.module = sender;
}

@end
