//
//  FileRecordParser.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/14/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FileRecordEntity;

@interface FileRecordParser : NSObject

+ (FileRecordEntity *)parseData:(NSArray *)data;

@end
