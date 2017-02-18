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
    
    let instanceOfSendText: SendText = SendText()
    let instanceOfCheckSMS: CheckSMS = CheckSMS()
    let instanceOfCheckPowerSource: CheckPowerSource = CheckPowerSource()
    
    var x = 0
    var y = 0
    
    func getStatus() -> Void {
        
        if (loggedBackIn == 0) {
            if (instanceOfCheckPowerSource.checkBattery() == -2 && y == 0) {
                watchBattery()
                y = 1
            }
        }
    }
    
    func watchBattery() -> Void {
        
        while (loggedBackIn == 0) {
            usleep(100000)
            if (instanceOfCheckPowerSource.checkBattery() != -2) {
                instanceOfSendText.sendBatteryTextAlert()
                sleep(10)
            }
        }
    }
    
    func watchMovement() -> Void {
        let watchZValue: Double = instanceOfCheckSMS.run()
        var currentZValue: Double = watchZValue
        
        while (loggedBackIn == 0) {
            usleep(100000)
            if (currentZValue > (watchZValue + 0.10) || currentZValue < (watchZValue - 0.10)){
                instanceOfSendText.sendMovementTextAlert()
                sleep(10)
            }
            
            currentZValue = instanceOfCheckSMS.run()
        }
    }
    
    
}
