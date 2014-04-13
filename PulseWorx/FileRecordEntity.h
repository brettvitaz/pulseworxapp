//
//  SystemElement.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/12/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

@interface FileRecordEntity : NSObject

/*
 1 = File Version
 2 = # UPB devices in the network
 3 = # of defined links
 4 = network id
 5 = network password
 */

@property (nonatomic) NSString *fileVersion;
@property (nonatomic) NSInteger *numberDevices;
@property (nonatomic) NSInteger *numberLinks;
@property (nonatomic) NSString *networkId;
@property (nonatomic) NSString *netowrkPassword;

@end
