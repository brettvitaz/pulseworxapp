//
//  InputTableViewCell.h
//  PulseWorx
//
//  Created by Brett Vitaz on 6/2/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputText;

@end
