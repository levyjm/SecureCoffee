//
//  CheckVitals.swift
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

import Foundation

class CheckVitals {
    
    func getStatus() -> Void {
        let instanceOfBridgedMac: BridgedMac = BridgedMac()
        print(instanceOfBridgedMac.checkBattery())
    }
    
}
