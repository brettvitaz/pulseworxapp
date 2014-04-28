//
//  RfiParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "RfiParser.h"

typedef NS_ENUM(NSUInteger, XpwRecordType) {
    RfiRemoteId = 1,
    RfiModuleId,
    RfiRemoteType,
    RfiRoomName,
    RfiRemoteName,
};

@implementation RfiParser

+ (RfiEntity *)parseData:(NSArray *)data {
    RfiEntity *entity = [[RfiEntity alloc] init];
    
    [entity setRemoteId:[[data objectAtIndex:RfiRemoteId] integerValue]];
    [entity setModuleId:[[data objectAtIndex:RfiModuleId] integerValue]];
    [entity setRemoteType:[[data objectAtIndex:RfiRemoteType] integerValue]];
    [entity setRoomName:[[data objectAtIndex:RfiRoomName] integerValue]];
    [entity setRemoteName:[[data objectAtIndex:RfiRemoteName] integerValue]];
    
    [entity setEntityId:[[data objectAtIndex:RfiModuleId] integerValue]];

    return entity;
}

@end
