//
//  DimmerTableViewController.m
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "DimmerTableViewController.h"
#import "ChannelInfoEntity.h"
#import "PulseWorxTableViewCell.h"
#import "PulseWorxController.h"
#import "FadeStartCommand.h"

@interface DimmerTableViewController ()

@property (nonatomic) NSArray *buttons;

@end

@implementation DimmerTableViewController

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
    
    [self setButtons:[[NSArray alloc] initWithObjects:@"On", @"Off", @"Raise", @"Lower", nil]];
    
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
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PulseWorxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Item" forIndexPath:indexPath];

    [[cell textLabel] setText:[[self buttons] objectAtIndex:[indexPath row]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    ChannelInfoEntity *entity = (ChannelInfoEntity *)[((PulseWorxTableViewCell *)[tableView cellForRowAtIndexPath:indexPath]) entity];
    NSUInteger networkNumber = [[[self pulseWorxSystem] fileRecord] networkId];
//    [[PulseWorxController sharedInstance] activateLink:[NSNumber numberWithInteger:[button linkId]] forNetwork:[NSNumber numberWithInteger:networkNumber]];

    switch ([indexPath row]) {
        case 0:
            [[PulseWorxController sharedInstance] sendMessage:[[[FadeStartCommand alloc] initWithId:[[self entity] moduleId] forNetwork:networkNumber forChannel:[[self entity] channelNumber] withLevel:255 withFadeRate:[[self entity] fadeRate]] getData]];
            break;
        case 1:
            [[PulseWorxController sharedInstance] sendMessage:[[[FadeStartCommand alloc] initWithId:[[self entity] moduleId] forNetwork:networkNumber forChannel:[[self entity] channelNumber] withLevel:0 withFadeRate:[[self entity] fadeRate]] getData]];
            break;
            
        default:
            break;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
