//
//  RecordParser.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/16/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecordParser : NSObject

- (id)initWithData:(NSArray *)data;

@end

@protocol RecordParser <NSObject>

+ (PulseWorxEntity *)parseData:(NSArray *)data;

@end