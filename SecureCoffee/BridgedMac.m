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

- (NSString *) checkBattery {
    
    NSString *sendTextString = [NSString stringWithFormat:@"\
                                tell application \"Messages\"\n\
                                set bounds of window 1 to {0, 0, 0, 0}\n\
                                set targetBuddy to \"+18042129310\"\n\
                                set targetService to id of 1st service whose service type = iMessage\n\
                                set textMessage to \"Hi there!\"\n\
                                set theBuddy to buddy targetBuddy of service id targetService\n\
                                send textMessage to theBuddy\n\
                                                     end tell"];
    
    NSAppleScript *textScript = [[NSAppleScript alloc] initWithSource:sendTextString];
    
    
    
    CFTimeInterval timeRemaining = IOPSGetTimeRemainingEstimate();
    if (timeRemaining == -2.0) {
        return @"Mac is plugged in";
    } else if (timeRemaining == -1.0) {
        return @"Mac was recently unplugged";
    } else {
        [textScript executeAndReturnError:nil];
        return @"Mac is not charging right now";
    }
}

@end
