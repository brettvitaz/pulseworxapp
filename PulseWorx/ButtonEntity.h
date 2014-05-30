//
//  ButtonEntity.h
//  PulseWorx
//
//  Created by Brett Vitaz on 4/26/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "PulseWorxEntity.h"

typedef enum : uint8_t {
    ActionGotoOff = 0,
    ActionGotoOn,
    ActionFadeDown,
    ActionFadeUp,
    ActionFadeStop,
    ActionDeactivate,
    ActionSnapOff,
    ActionSnapOn,
    ActionQuickOff,
    ActionQuickOn,
    ActionSlowOff,
    ActionSlowOn,
    ActionBlink,
    ActionNull,
    ActionNoCommand,
} ButtonAction;

@interface ButtonEntity : PulseWorxEntity

/*
 • Channel #
 • Component #
 • Module id
 • Button link id
 • Single click action
 • Double click action
 • Hold action
 • Release action
 • Single click toggle action
 • Double click toggle action
 • Hold toggle action
 • Release toggle action
 • Indicator link
 • Indicator byte (* see below)
 */

/*
 Actions
 0 Goto Off
 1 Goto On
 2 Fade Down
 3 Fade Up
 4 Fade Stop
 5 Deactivate
 6 Activate
 7 Snap Off
 8 Snap On
 9 Quick Off
 10 Quick On
 11 Slow Off
 12 Slow On
 13 Blink
 14 Null
 15 No Command
 */

@property (nonatomic, assign) uint8_t channelNumber;
@property (nonatomic, assign) uint8_t componentNumber;
@property (nonatomic, assign) uint8_t moduleId;
@property (nonatomic, assign) uint8_t linkId;
@property (nonatomic, assign) ButtonAction singleClickAction;
@property (nonatomic, assign) ButtonAction doubleClickAction;
@property (nonatomic, assign) ButtonAction holdAction;
@property (nonatomic, assign) ButtonAction releaseAction;
@property (nonatomic, assign) ButtonAction singleClickToggleAction;
@property (nonatomic, assign) ButtonAction doubleClickToggleAction;
@property (nonatomic, assign) ButtonAction holdToggleAction;
@property (nonatomic, assign) ButtonAction releaseToggleAction;
@property (nonatomic, assign) uint8_t indicatorLinkId;
@property (nonatomic, assign) uint8_t indicatorByte;

@property (nonatomic, assign) BOOL singleClickToggleState;
@property (nonatomic, assign) BOOL doubleClickToggleState;
@property (nonatomic, assign) BOOL holdToggleState;

@end
