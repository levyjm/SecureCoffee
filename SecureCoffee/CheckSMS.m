//
//  CheckSMS.m
//  SecureCoffee
//
//  Created by John on 2/15/17.
//  Copyright © 2017 john. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMSLib/smslib.h"
#import "CheckSMS.h"

@implementation CheckSMS

- (void)logCallback: (NSString *)logMessage {
    NSLog(@"%@", logMessage);
}


- (double) runSMS {
    
    sms_acceleration smsObject;
    
    int smsStarted = smsStartup(self, @selector(logCallback:));
    
    if (smsStarted != SMS_SUCCESS) {
        return -1.0;
    }
    
    
    int checkSMSData = smsGetData(&smsObject);
    
    if (checkSMSData != SMS_SUCCESS) {
        return -1.0;
    }
    
    return smsObject.z;
    
}


@end
