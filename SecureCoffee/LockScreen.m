//
//  LockScreen.m
//  SecureCoffee
//
//  Created by John on 1/14/17.
//  Copyright © 2017 john. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LockScreen.h"//>


@implementation LockScreen

- (int) lockScreen
{
    NSTask *task;
    NSArray *arguments = [NSArray arrayWithObject:@"-suspend"];
    
    task = [[NSTask alloc] init];
    [task setArguments: arguments];
    [task setLaunchPath: @"/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession"];
    [task launch];
    NSLog(@"screen is Locked");
    
    return 0;
}

@end
