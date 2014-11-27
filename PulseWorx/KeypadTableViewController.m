//
//  KeypadTableViewController.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/27/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "KeypadTableViewController.h"
#import "ButtonEntity.h"
#import "ModuleEntity.h"
#import "PulseWorxController.h"
#import "PulseWorxTableViewCell.h"
#import "RampControlTableViewCell.h"

#define TEST_EXPANDED_ROW 1
@interface KeypadTableViewController ()

@property (nonatomic) NSMutableArray *buttonList;

@end

@implementation KeypadTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.buttonList = [NSMutableArray arrayWithArray:[self.pulseWorxSystem getButtonsForKeypad:self.module.entityId]];
    [self.tableView registerNib:[UINib nibWithNibName:@"RampControlTableViewCell" bundle:nil] forCellReuseIdentifier:@"RampControlCell"];
    [self.tableView reloadData];
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}



- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.buttonList.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RampControlTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RampControlCell" forIndexPath:indexPath];
    ButtonEntity *button = self.buttonList[indexPath.row];
    cell.entity = button;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    float height = 70.0;
    
//    if (indexPath.row == TEST_EXPANDED_ROW) {
//        height = 120.0;
//    }
    
    return height;
    
}

/*
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Insert");
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
    NSMutableArray *insertingRows = [NSMutableArray arrayWithObject:newIndexPath];
    [self.buttonList insertObject:[[ButtonEntity alloc] init] atIndex:indexPath.row + 1];

    [tableView beginUpdates];
    [tableView insertRowsAtIndexPaths:insertingRows withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView endUpdates];

}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/



/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/



/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
