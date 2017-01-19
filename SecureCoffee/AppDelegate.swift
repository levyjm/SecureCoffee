//
//  AppDelegate.swift
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

import Cocoa
import Foundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let vitalChecker = CheckVitals()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let backgroundQueue = DispatchQueue(label: "com.app.queue", qos: .background, target: nil)
            SleepChecker.caller()
            backgroundQueue.async {
            print("Run on background thread")
            self.vitalChecker.getStatus()
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

