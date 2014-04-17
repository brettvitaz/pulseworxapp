//
//  SystemElement.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/12/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

@interface FileRecordEntity : PulseWorxEntity

/*
 2 = File Version
 3 = # UPB devices in the network
 4 = # of defined links
 5 = network id
 6 = network password
 */

@property (nonatomic) NSString *fileVersion;
@property (nonatomic, assign) NSUInteger numberDevices;
@property (nonatomic, assign) NSUInteger numberLinks;
@property (nonatomic) NSString *networkId;
@property (nonatomic) NSString *networkPassword;

@end
