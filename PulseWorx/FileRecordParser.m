//
//  FileRecordParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/14/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "FileRecordParser.h"
#import "FileRecordEntity.h"

typedef enum : uint8_t {
    FileVersion = 1,
    FileNumberOfDevices,
    FileNumberOfLinks,
    FileNetworkId,
    FileNetworkPassword,
} FileRecordType;

@implementation FileRecordParser

+ (FileRecordEntity *)parseData:(NSArray *)data {
    
    FileRecordEntity *entity = [[FileRecordEntity alloc] init];
    [entity setEntityName:@"FileRecord"];
    [entity setEntityId:0];
    
    [entity setFileVersion:[data objectAtIndex:FileVersion]];
    [entity setNumberDevices:[[data objectAtIndex:FileNumberOfDevices] intValue]];
    [entity setNumberLinks:[[data objectAtIndex:FileNumberOfLinks] intValue]];
    [entity setNetworkId:[[data objectAtIndex:FileNetworkId] intValue]];
    [entity setNetworkPassword:[NSString stringWithFormat:@"%x", [[data objectAtIndex:FileNetworkPassword] intValue]]];
    
    return entity;
}

@end
