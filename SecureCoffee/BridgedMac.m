//
//  BridgedMac.m
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IOKit/ps/IOPowerSources.h>
#import <IOKit/pwr_mgt/IOPMLib.h>
#import "BridgedMac.h"

@implementation BridgedMac

NSString *buddyNumber;

- (int) checkBattery {
    
    CFTimeInterval timeRemaining = IOPSGetTimeRemainingEstimate();
    if (timeRemaining == -2.0) {
        return -2;
    } else if (timeRemaining == -1.0) {
        return -1;
    } else {
        return 0;
    }
}

- (void) setNewNumber: (NSString*) number {
    buddyNumber = number;
}

- (void) sendSleepTextAlert {
    
    
    NSString *sendTextString = [NSString stringWithFormat:@"\
                                tell application \"Messages\"\n\
                                set miniaturized of window 1 to true\n\
                                send \"Your machine is going to sleep!\" to buddy \"%@\" of service \"SMS\"\n\
                                set miniaturized of window 1 to true\n\
                                end tell", buddyNumber];
    
    NSAppleScript *textScript = [[NSAppleScript alloc] initWithSource:sendTextString];
    [textScript executeAndReturnError:nil];
}

- (void) sendBatteryTextAlert {
    
    NSString *sendTextString = [NSString stringWithFormat:@"\
                                tell application \"Messages\"\n\
                                set miniaturized of window 1 to true\n\
                                send \"Your machine has been unplugged!\" to buddy \"%@\" of service \"SMS\"\n\
                                set miniaturized of window 1 to true\n\
                                end tell", buddyNumber];
    
    NSAppleScript *textScript = [[NSAppleScript alloc] initWithSource:sendTextString];
    [textScript executeAndReturnError:nil];
}

@end
