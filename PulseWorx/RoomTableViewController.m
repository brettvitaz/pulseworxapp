//
//  UpeTableViewController.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/12/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "RoomTableViewController.h"
#import "ImportUpe.h"
#import "PulseWorxSystem.h"
#import "DevicesTableViewController.h"

@interface RoomTableViewController ()

@property (nonatomic) PulseWorxSystem *pulseWorxSystem;
@property (nonatomic) NSArray *listData;

@end

@implementation RoomTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setPulseWorxSystem:[[[ImportUpe alloc] initWithFile:@"Redmond2"] pulseworxSystem]];
    if ([self listData] == nil) {
        [self setListData:[NSArray arrayWithArray:[[[self pulseWorxSystem] getRoomNames] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]]];
        [self setNavigationLevel:Rooms];
    }

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self listData] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Item" forIndexPath:indexPath];
    
//    [[cell textLabel] setText:[NSString stringWithFormat:@"Item %d", indexPath.row]];
    [[cell textLabel] setText:[[self listData] objectAtIndex:[indexPath row]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DevicesTableViewController *controller = [segue destinationViewController];
    [controller setPulseWorxSystem:[self pulseWorxSystem]];
    [controller setRoomName:[[sender textLabel] text]];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
//    if ([identifier isEqualToString:@"DevicesNavigationSegue"]) {
//        return NO;
//    }
    return YES;
}

@end
