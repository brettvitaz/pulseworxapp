//
//  RecordParser.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/16/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "RecordParser.h"

@interface RecordParser()

- (id)parseData:(NSArray *)data;

@end
@implementation RecordParser

- (id)initWithData:(NSArray *)data {
    if (self = [super init]) {
        [self parseData:data];
    }
    return self;
}

- (id)parseData:(NSArray *)data {
    return nil;
}

@end
