//
//  PulseWorxEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/12/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PulseWorxEntity : NSObject

@property (nonatomic, copy) NSString *entityName;
@property (nonatomic, assign) uint8_t entityId;

@end
