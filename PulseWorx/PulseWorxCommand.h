//
//  PulseWorxMessage.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/30/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PulseWorxMessageConstants.h"

@protocol PulseWorxCommand <NSObject>

- (char)getType;
- (NSData *)getCommand;

@end

@interface PulseWorxCommand : NSObject <PulseWorxCommand>

@property (nonatomic, readonly) uint8_t deviceId;
@property (nonatomic, readonly) uint8_t networkId;

- (id)initWithId:(uint8_t)theId forNetwork:(uint8_t)networkId;

- (NSData *)createHeader:(LinkType)linkType withLength:(uint8_t)length;

- (NSData *)getData;

- (uint8_t)calculateChecksum:(uint8_t *)bytes withSize:(size_t)size;

@end
