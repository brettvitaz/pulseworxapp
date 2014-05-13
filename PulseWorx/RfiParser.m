//
//  RfiParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "RfiParser.h"

typedef enum : uint8_t {
    RfiRemoteId = 1,
    RfiModuleId,
    RfiRemoteType,
    RfiRoomName,
    RfiRemoteName,
} XpwRecordType;

@implementation RfiParser

+ (RfiEntity *)parseData:(NSArray *)data {
    RfiEntity *entity = [[RfiEntity alloc] init];
    
    [entity setRemoteId:[[data objectAtIndex:RfiRemoteId] intValue]];
    [entity setModuleId:[[data objectAtIndex:RfiModuleId] intValue]];
    [entity setRemoteType:[[data objectAtIndex:RfiRemoteType] intValue]];
    [entity setRoomName:[[data objectAtIndex:RfiRoomName] intValue]];
    [entity setRemoteName:[[data objectAtIndex:RfiRemoteName] intValue]];
    
    [entity setEntityId:[[data objectAtIndex:RfiModuleId] intValue]];

    return entity;
}

@end
