//
//  CheckVitals.swift
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

import Foundation
import Cocoa

class CheckVitals: NSObject {
    
    let instanceOfBridgedMac: BridgedMac = BridgedMac()
    
    var x = 0
    var y = 0
    
    
    func getStatus() -> Void {
        
        while (loggedBackIn == 0) {
            usleep(100000)
            if (instanceOfBridgedMac.checkBattery() == -2 && y == 0) {
                watchBattery()
                y = 1
            }
        }
    }
    
    func watchBattery() -> Void {
        
        while (loggedBackIn == 0) {
            if (instanceOfBridgedMac.checkBattery() != -2) {
                instanceOfBridgedMac.sendBatteryTextAlert()
                sleep(10)
            }
        }
    }
}
