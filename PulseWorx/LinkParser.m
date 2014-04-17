//
//  LinkParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/16/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "LinkParser.h"

typedef enum : NSUInteger {
    LINK_ID,
    LINK_NAME
} LinkRecordData;

@implementation LinkParser

+ (PulseWorxEntity *)parseData:(NSArray *)parseData {
    
    LinkEntity *entity = [[LinkEntity alloc] init];
    
    [entity setLinkId:[[parseData objectAtIndex:LINK_ID] integerValue]];
    [entity setName:[parseData objectAtIndex:LINK_NAME]];
    
    return entity;
}

@end
