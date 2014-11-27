//
//  Constants.h
//  PulseWorx
//
//  Created by Brett Vitaz on 11/23/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#define INVALIDATE_TIMER(__TIMER) { [__TIMER invalidate]; __TIMER = nil; }

#define PING_INTERRUPTED            @"pingsInterrupted"
#define PING_RESTORED               @"pingRestored"
#define CONNECTION_LOST_EVENT       @"connectionLost"
#define CONNECTION_ERROR_EVENT      @"connectionError"
#define CONNECTION_CONNECTED_EVENT  @"connectionConnected"

#define SETTINGS_CONNECTION_LOCATIONS           @"ConnectionLocations"
#define SETTINGS_CONNECTION_CURRENT_LOCATION    @"ConnectionCurrentLocation"