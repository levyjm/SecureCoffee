//
//  SleepChecker.h
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

#ifndef SleepChecker_h
#define SleepChecker_h
#import <Foundation/Foundation.h>
#import <IOKit/pwr_mgt/IOPMLib.h>

@interface SleepChecker : NSObject 
@property (strong, nonatomic) id someProperty;

- (NSString *) checkWoke;
+ (int) caller;

@end

#endif /* SleepChecker_h */
