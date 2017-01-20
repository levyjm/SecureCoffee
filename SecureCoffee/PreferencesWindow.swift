//
//  PreferencesWindow.swift
//  SecureCoffee
//
//  Created by John on 1/15/17.
//  Copyright © 2017 john. All rights reserved.
//

import Cocoa
import ServiceManagement

class PreferencesWindow: NSWindowController {
    
    @IBOutlet weak var checkBox: NSButton!
    @IBOutlet weak var phoneNumberLabel: NSTextField!
    @IBOutlet weak var enterNumberLabel: NSTextField!
    @IBOutlet weak var currentNumber: NSTextField!
    
    let instanceOfBridgedMac: BridgedMac = BridgedMac()
    let defaults = UserDefaults.standard

    convenience init() {
        self.init(windowNibName: "PreferencesWindow")
    }
    
    override func windowDidLoad() {
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        self.window?.styleMask.remove(NSWindowStyleMask.resizable)
        NSApp.activate(ignoringOtherApps: true)
        
        if (defaults.bool(forKey: "numberIsSet")) {
            currentNumber.stringValue = defaults.string(forKey: "phoneNumber")!
            
        }
    }
    
    @IBAction func startAtLogin(_ sender: Any) {
        let bundleID = "com.apple.jhnlvy.SecureCoffee" as CFString
        let autoLaunch = (checkBox.state == NSOnState)
        if SMLoginItemSetEnabled(bundleID, autoLaunch) {
            if autoLaunch {
                NSLog("Successfully add login item.")
            } else {
                NSLog("Successfully remove login item.")
            }
                NSLog("Failed to add login item.")
            }
    }
    
    @IBAction func setText(_ sender: Any) {
        let desiredNumber = enterNumberLabel.stringValue as String
        
        let newNumber = String(desiredNumber.characters.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil })
        
        defaults.setValue(newNumber, forKey: "phoneNumber")
        defaults.set(true, forKey: "numberIsSet")
        
        instanceOfBridgedMac.setNewNumber(defaults.object(forKey: "phoneNumber") as! String!)
        currentNumber.stringValue = defaults.string(forKey: "phoneNumber")!
        enterNumberLabel.stringValue = ""
    }
    
    @IBAction func clickDone(_ sender: Any) {
        enterNumberLabel.stringValue = ""
        self.close()
    }
    
}
