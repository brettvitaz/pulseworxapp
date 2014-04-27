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

@property (nonatomic, assign) NSUInteger remoteId;
@property (nonatomic, assign) NSUInteger moduleId;
@property (nonatomic, assign) NSUInteger remoteType;
@property (nonatomic, assign) NSUInteger roomName;
@property (nonatomic, assign) NSUInteger remoteName;

@end
