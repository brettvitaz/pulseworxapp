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
    entity.entityName = @"FileRecord";
    entity.entityId = 0;
    
    entity.fileVersion = [data objectAtIndex:FileVersion];
    entity.numberDevices = [[data objectAtIndex:FileNumberOfDevices] intValue];
    entity.numberLinks = [[data objectAtIndex:FileNumberOfLinks] intValue];
    entity.networkId = [[data objectAtIndex:FileNetworkId] intValue];
    entity.networkPassword = [NSString stringWithFormat:@"%x", [[data objectAtIndex:FileNetworkPassword] intValue]];
    
    return entity;
}

@end
