//
//  PulseWorxMessage.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/30/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PulseWorxMessageConstants.h"

@interface PulseWorxTransmitCommand : NSObject

@property (nonatomic, readonly) uint8_t messageType;
@property (nonatomic, readonly) uint8_t deviceId;
//@property (nonatomic, readonly) uint8_t networkId;

- (id)initLink:(uint8_t)linkId;
- (id)initModule:(uint8_t)moduleId;


- (NSData *)getData;
- (uint8_t)calculateChecksum:(uint8_t *)bytes withSize:(size_t)size;

- (NSData *)getCommand;

@end
