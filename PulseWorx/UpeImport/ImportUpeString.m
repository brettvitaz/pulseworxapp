//
//  ImportUpeFile.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/12/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ImportUpeString.h"

@interface ImportUpeString()

@property (nonatomic, strong) NSString *upeString;
- (void)parseString:(NSString *)upeString;

@end

@implementation ImportUpeString

- (id)initWithString:(NSString *)upeString {
    self = [super init];
    if (self) {
        [self setUpeString:upeString];
        [self parseString:upeString];
    }
    return self;
}

- (void)parseString:(NSString *)upeString {
    NSMutableArray *elements = [NSMutableArray array];
    
}

@end
