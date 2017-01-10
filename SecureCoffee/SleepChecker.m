//
//  SleepChecker.m
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SleepChecker.h"

#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>

#include <mach/mach_port.h>
#include <mach/mach_interface.h>
#include <mach/mach_init.h>

#include <IOKit/pwr_mgt/IOPMLib.h>
#include <IOKit/IOMessage.h>

io_connect_t  root_port;

@implementation SleepChecker

- (NSString *) checkWoke {
    CFStringRef reasonForActivity= CFSTR("Alerting user!");
    
    IOPMAssertionID assertionID;
    IOReturn success = IOPMAssertionCreateWithName(kIOPMAssertionTypeNoDisplaySleep,
                                                   kIOPMAssertionLevelOn, reasonForActivity, &assertionID);
    
    if (success == kIOReturnSuccess)
    {
        printf("%s", "Computer is going to sleep now!\n");
        success = IOPMAssertionRelease(assertionID);
    }
    
    return @"Asleep";
}


//- (void) MySleepCallBack: (void *)refCon paramName2:(io_service_t)service paramName3:(natural_t)messageType paramName4:(void *)messageArgument

void MySleepCallBack (void* refCon, io_service_t service, natural_t messageType, void *messageArgument)
{
    
    IOReturn ioReturn;
    printf( "messageType %08lx, arg %08lx\n",
           (long unsigned int)messageType,
           (long unsigned int)messageArgument );
    
    switch ( messageType )
    {
        case kIOMessageSystemWillSleep:
            /* The system WILL go to sleep. If you do not call IOAllowPowerChange or
             IOCancelPowerChange to acknowledge this message, sleep will be
             delayed by 30 seconds.
             
             NOTE: If you call IOCancelPowerChange to deny sleep it returns
             kIOReturnSuccess, however the system WILL still go to sleep.
             */
            
            printf("Going to sleep...\n");
            ioReturn = IOCancelPowerChange( root_port, (long)messageArgument );
            printf("%d", ioReturn);
            break;
            
    }
}


- (int) caller {
    // notification port allocated by IORegisterForSystemPower
    IONotificationPortRef  notifyPortRef;
    
    // notifier object, used to deregister later
    io_object_t            notifierObject;
    // this parameter is passed to the callback
    void*                  refCon;
    
    // register to receive system sleep notifications
    root_port = IORegisterForSystemPower( refCon, &notifyPortRef, MySleepCallBack, &notifierObject );
    
    if ( root_port == 0 )
    {
        printf("IORegisterForSystemPower failed\n");
        return 1;
    }
    
    // add the notification port to the application runloop
    CFRunLoopAddSource( CFRunLoopGetCurrent(),
                       IONotificationPortGetRunLoopSource(notifyPortRef), kCFRunLoopCommonModes );
    
    /* Start the run loop to receive sleep notifications. Don't call CFRunLoopRun if this code
     is running on the main thread of a Cocoa or Carbon application. Cocoa and Carbon
     manage the main thread's run loop for you as part of their event handling
     mechanisms.
     */
    CFRunLoopRun();
    
    //Not reached, CFRunLoopRun doesn't return in this case.
    return (0);
}


@end
