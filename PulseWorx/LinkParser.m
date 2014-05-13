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
    
    [entity setLinkId:[[data objectAtIndex:LinkId] intValue]];
    [entity setLinkName:[data objectAtIndex:LinkName]];
    
    [entity setEntityId:[[data objectAtIndex:LinkId] intValue]];
    [entity setEntityName:[data objectAtIndex:LinkName]];

    return entity;
}

@end
