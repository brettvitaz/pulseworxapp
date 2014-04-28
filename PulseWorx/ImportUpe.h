//
//  ImportUpeFile.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/12/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PulseWorxSystem.h"

@interface ImportUpe : NSObject

@property (nonatomic) PulseWorxSystem *pulseworxSystem;

- (id)initWithString:(NSString *)upeString;
- (id)initWithFile:(NSString *)upeFile;

//- (NSArray *)getRoomNames;
//
//- (NSDictionary *)getDevicesForRoom:(NSString *)roomName;

@end
