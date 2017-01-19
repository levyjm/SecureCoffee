//
//  BridgedMac.h
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

#ifndef BridgedMac_h
#define BridgedMac_h
#import <Foundation/Foundation.h>
#import <IOKit/pwr_mgt/IOPMLib.h>

@interface BridgedMac : NSObject
@property (strong, nonatomic) id someProperty;

- (int) checkBattery;
- (void) setNewNumber: (NSString*) number;
- (void) sendBatteryTextAlert;
- (void) sendSleepTextAlert;



@end

#endif /* BridgedMac_h */
