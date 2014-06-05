//
//  AddServerTableViewController.m
//  PulseWorx
//
//  Created by Brett Vitaz on 6/2/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "AddServerTableViewController.h"
#import "InputTableViewCell.h"
#import "SwitchTableViewCell.h"

@interface AddServerTableViewController () <SwitchTableCellDelegate>

@property (nonatomic) NSMutableArray *serverCells;
@property (nonatomic) NSMutableArray *exportFileCells;
@property (nonatomic) NSArray *allCells;
@end

@implementation AddServerTableViewController

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
    
    self.serverCells = [[NSMutableArray alloc] init];
//    NSDictionary *nameCellDict = @{ @"title" : @"Server Name",
//                                    @"placeholder" : @"Name" };
    InputTableViewCell *nameCell = [[InputTableViewCell alloc] initWithCoder:nil];
    nameCell.titleLabel.text = @"Server Name";
    nameCell.inputText.placeholder = @"Name";
    [self.serverCells addObject:nameCell];
    InputTableViewCell *addressCell = [[InputTableViewCell alloc] initWithCoder:nil];
    addressCell.titleLabel.text = @"Network Address";
    addressCell.inputText.placeholder = @"192.168.1.100";
    [self.serverCells addObject:addressCell];
    InputTableViewCell *portCell = [[InputTableViewCell alloc] initWithCoder:nil];
    portCell.titleLabel.text = @"Network Port";
    portCell.inputText.placeholder = @"2101";
    [self.serverCells addObject:portCell];
    
    self.exportFileCells = [[NSMutableArray alloc] initWithCoder:nil];
    SwitchTableViewCell *useExportFileCell = [[SwitchTableViewCell alloc] init];
    useExportFileCell.titleLabel.text = @"Download Export File";
    useExportFileCell.delegate = self;
    
    self.allCells = @[self.serverCells, self.exportFileCells];
    
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
    return [self.allCells count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.allCells[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = self.allCells[indexPath.section][indexPath.row]; //[tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
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

#pragma mark - SwitchCellDelegate

- (void)switchTableCellDidSwitch:(SwitchTableViewCell *)cell {
    BOOL value = ((SwitchTableViewCell *)cell).optionSwitch.on;
    NSLog(@"Switch is %@", value ? @"on" : @"off");
}

@end
