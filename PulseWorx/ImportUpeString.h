//
//  ImportUpeFile.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/12/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImportUpeString : NSObject

@property (nonatomic) NSArray *elements;

- (id)initWithString:(NSString *)upeString;

@end
