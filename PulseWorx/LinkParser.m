//
//  LinkParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/16/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "LinkParser.h"

typedef NS_ENUM(NSUInteger, LinkRecordType) {
    LinkId = 1,
    LinkName,
};

@implementation LinkParser

+ (LinkEntity *)parseData:(NSArray *)data {
    
    LinkEntity *entity = [[LinkEntity alloc] init];
    
    [entity setLinkId:[[data objectAtIndex:LinkId] integerValue]];
    [entity setLinkName:[data objectAtIndex:LinkName]];
    
    [entity setEntityId:[[data objectAtIndex:LinkId] integerValue]];
    [entity setEntityName:[data objectAtIndex:LinkName]];

    return entity;
}

@end
