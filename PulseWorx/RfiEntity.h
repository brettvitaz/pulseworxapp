//
//  RfiEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

@interface RfiEntity : PulseWorxEntity

/*
 • Remote id (0 to 8)
 • Module id
 • Remote type
 • Room name
 • Remote name
 */

@property (nonatomic, assign) uint8_t remoteId;
@property (nonatomic, assign) uint8_t moduleId;
@property (nonatomic, assign) uint8_t remoteType;
@property (nonatomic, assign) uint8_t roomName;
@property (nonatomic, assign) uint8_t remoteName;

@end
