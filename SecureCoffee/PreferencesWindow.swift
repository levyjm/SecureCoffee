//
//  PreferencesWindow.swift
//  SecureCoffee
//
//  Created by John on 1/15/17.
//  Copyright © 2017 john. All rights reserved.
//

import Cocoa

class PreferencesWindow: NSWindowController {
    let instanceOfBridgedMac: BridgedMac = BridgedMac()
    @IBOutlet weak var enterNumberLabel: NSTextField!
    @IBOutlet weak var currentNumber: NSTextField!


    convenience init() {
        self.init(windowNibName: "PreferencesWindow")
        NSApp.activate(ignoringOtherApps: true)
    }
    
    override func windowDidLoad() {
    }
    
    
    @IBAction func setText(_ sender: Any) {
        let desiredNumber = enterNumberLabel.stringValue as String
        
        let newNumber = String(desiredNumber.characters.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil })
        
        instanceOfBridgedMac.setNewNumber(newNumber)
        currentNumber.stringValue = newNumber as String
    }
    
    @IBAction func clickDone(_ sender: Any) {
        self.close()
    }
    
    
}
