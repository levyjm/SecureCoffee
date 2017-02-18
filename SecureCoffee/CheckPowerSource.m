//
//  CheckPowerSource.m
//  SecureCoffee
//
//  Created by John on 2/18/17.
//  Copyright © 2017 john. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IOKit/ps/IOPowerSources.h>
#import <IOKit/pwr_mgt/IOPMLib.h>
#import "CheckPowerSource.h"

@implementation CheckPowerSource

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

@end
