//
//  FileRecordParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/14/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "FileRecordParser.h"

typedef NS_ENUM(NSUInteger, FileRecordType) {
    FileVersion = 1,
    FileNumberOfDevices,
    FileNumberOfLinks,
    FileNetworkId,
    FileNetworkPassword,
};
@implementation FileRecordParser

+ (FileRecordEntity *)parseData:(NSArray *)data {
    
    FileRecordEntity *entity = [[FileRecordEntity alloc] init];
    [entity setName:@"FileRecord"];
    [entity setEntityId:0];
    
    [entity setFileVersion:[data objectAtIndex:FileVersion]];
    [entity setNumberDevices:[[data objectAtIndex:FileNumberOfDevices] integerValue]];
    [entity setNumberLinks:[[data objectAtIndex:FileNumberOfLinks] integerValue]];
    [entity setNetworkId:[data objectAtIndex:FileNetworkId]];
    [entity setNetworkPassword:[NSString stringWithFormat:@"%x", [[data objectAtIndex:FileNetworkPassword] integerValue]]];
    
    return entity;
}

@end
