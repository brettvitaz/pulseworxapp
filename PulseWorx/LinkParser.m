//
//  LinkParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/16/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "LinkParser.h"

typedef enum : uint8_t {
    LinkId = 1,
    LinkName,
} LinkRecordType;

@implementation LinkParser

+ (LinkEntity *)parseData:(NSArray *)data {
    
    LinkEntity *entity = [[LinkEntity alloc] init];
    
    entity.linkId = [[data objectAtIndex:LinkId] intValue];
    entity.linkName = [data objectAtIndex:LinkName];
    
    entity.entityId = [[data objectAtIndex:LinkId] intValue];
    entity.entityName = [data objectAtIndex:LinkName];

    return entity;
}

@end
