//
//  ControlCell.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ControlCellDelegate.h"

@interface ControlCell : UIControl

@property (strong, nonatomic) id<ControlCellDelegate> delegate;

@end
