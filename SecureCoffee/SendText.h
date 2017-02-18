//
//  BridgedMac.h
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

#ifndef SendText_h
#define SendText_h
#import <Foundation/Foundation.h>

@interface SendText : NSObject
@property (strong, nonatomic) id someProperty;

- (void) setNewNumber: (NSString*) number;
- (void) sendBatteryTextAlert;
- (void) sendSleepTextAlert;
- (void) sendMovementTextAlert;

@end

#endif /* SendText_h */
