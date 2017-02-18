//
//  SleepChecker.m
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SleepChecker.h"
#import "SendText.h"

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
        success = IOPMAssertionRelease(assertionID);
    }
    
    return @"Asleep";
}

void MySleepCallBack (void* refCon, io_service_t service, natural_t messageType, void *messageArgument)
{
    
    SendText *instanceOfSendText = [[SendText alloc] init];
    
    IOReturn ioReturn;
    printf( "messageType %08lx, arg %08lx\n",
           (long unsigned int)messageType,
           (long unsigned int)messageArgument );
    
    switch ( messageType )
    {
        case kIOMessageSystemWillSleep:
            
            [instanceOfSendText sendSleepTextAlert];
            ioReturn = IOCancelPowerChange( root_port, (long)messageArgument );
            printf("%d", ioReturn);
            break;
            
    }
}


+ (int) caller {
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

