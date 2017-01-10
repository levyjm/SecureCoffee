//
//  BridgedMac.m
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IOKit/ps/IOPowerSources.h>
#import "BridgedMac.h"

@implementation BridgedMac

- (NSString *) checkBattery {
    CFTimeInterval timeRemaining = IOPSGetTimeRemainingEstimate();
    if (timeRemaining == -2.0) {
        return @"Mac is plugged in";
    } else if (timeRemaining == -1.0) {
        return @"Mac was recently unplugged";
    } else {
        return @"Mac is and has been charging";
    }
}


@end
