//
//  SwitchTableViewCell.h
//  PulseWorx
//
//  Created by Brett Vitaz on 6/2/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwitchTableCellDelegate;

@interface SwitchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISwitch *optionSwitch;

@property (nonatomic) id<SwitchTableCellDelegate> delegate;

@end

@protocol SwitchTableCellDelegate <NSObject>

- (void)switchTableCellDidSwitch:(SwitchTableViewCell *)cell;

@end