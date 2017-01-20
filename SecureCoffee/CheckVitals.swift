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
    
    func getStatus() -> Void {
        
        while (true) {
            if (instanceOfBridgedMac.checkBattery() == -2) {
                print("watching battery...")
                watchBattery()
            }
        }
    }
    
    func watchBattery() -> Void {
        while (true) {
            if (instanceOfBridgedMac.checkBattery() != -2) {
                print("sending text...")
                instanceOfBridgedMac.sendBatteryTextAlert()
                sleep(10)
            }
        }
    }
}
