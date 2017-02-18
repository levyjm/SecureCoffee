//
//  CheckPowerSource.h
//  SecureCoffee
//
//  Created by John on 2/18/17.
//  Copyright © 2017 john. All rights reserved.
//

#ifndef CheckPowerSource_h
#define CheckPowerSource_h

#import <Foundation/Foundation.h>
#import <IOKit/pwr_mgt/IOPMLib.h>
#import <IOKit/PS/IOPowerSources.h>

@interface CheckPowerSource : NSObject
@property (strong, nonatomic) id someProperty;

- (int) checkBattery;

@end


#endif /* CheckPowerSource_h */
