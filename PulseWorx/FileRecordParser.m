//
//  FileRecordParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/14/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "FileRecordParser.h"

typedef enum : NSUInteger {
    KEY,
    FILE_VERSION,
    NUMBER_OF_DEVICES,
    NUMBER_OF_LINKS,
    NETWORK_ID,
    NETWORK_PASSWORD
} FileRecordData;

@implementation FileRecordParser

+ (PulseWorxEntity *)parseData:(NSArray *)parseData {
    
    FileRecordEntity *entity = [[FileRecordEntity alloc] init];
    
    [entity setFileVersion:[parseData objectAtIndex:FILE_VERSION]];
    [entity setNumberDevices:[[parseData objectAtIndex:NUMBER_OF_DEVICES] integerValue]];
    [entity setNumberLinks:[[parseData objectAtIndex:NUMBER_OF_LINKS] integerValue]];
    [entity setNetworkId:[parseData objectAtIndex:NETWORK_ID]];
    [entity setNetworkPassword:[NSString stringWithFormat:@"%x", [[parseData objectAtIndex:NETWORK_PASSWORD] integerValue]]];
    
    return entity;
}

@end
