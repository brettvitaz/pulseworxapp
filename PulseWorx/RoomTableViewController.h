//
//  UpeTableViewController.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/12/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, NavigationLevel) {
    Rooms = 1,
    Devices,
    Keypad,
};

@interface RoomTableViewController : UITableViewController

@property (nonatomic, assign) NavigationLevel navigationLevel;

@end
