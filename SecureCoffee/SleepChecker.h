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

//- (void) MySleepCallBack:(void *)refCon paramName2:(io_service_t)service paramName3:(natural_t)messageType paramName4:(void *)messageArgument;
void MySleepCallBack (void* refCon, io_service_t service, natural_t messageType, void *messageArgument);
- (NSString *) checkWoke;
- (int) caller;

@end

#endif /* SleepChecker_h */
