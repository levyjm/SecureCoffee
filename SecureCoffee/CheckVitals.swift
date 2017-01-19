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
    
    func getStatus() -> Void {
        let instanceOfBridgedMac: BridgedMac = BridgedMac()
        
        while (instanceOfBridgedMac.checkBattery() == -2) {
            if (instanceOfBridgedMac.checkBattery() != -2) {
                instanceOfBridgedMac.sendBatteryTextAlert()
                break
            }
        }
    }
}
