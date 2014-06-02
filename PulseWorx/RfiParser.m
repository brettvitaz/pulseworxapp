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
    
    entity.remoteId = [[data objectAtIndex:RfiRemoteId] intValue];
    entity.moduleId = [[data objectAtIndex:RfiModuleId] intValue];
    entity.remoteType = [[data objectAtIndex:RfiRemoteType] intValue];
    entity.roomName = [[data objectAtIndex:RfiRoomName] intValue];
    entity.remoteName = [[data objectAtIndex:RfiRemoteName] intValue];
    
    entity.entityId = [[data objectAtIndex:RfiModuleId] intValue];

    return entity;
}

@end
