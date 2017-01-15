//
//  MenuController.swift
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

import Cocoa

class MenuController: NSObject {
    
    @IBOutlet weak var statusMenu: NSMenu!
    var preferencesWindow: SetPreferences!
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    
    override func awakeFromNib() {
        statusItem.title = "Secure Coffee"
        statusItem.menu = statusMenu
        preferencesWindow = SetPreferences()
    }
    
    // create a CheckVitals Object
    let vitalChecker = CheckVitals()
    
    @IBAction func clickedPreferences(_ sender: Any) {
        preferencesWindow.showWindow(nil)
    }

    @IBAction func lockComputer(_ sender: Any) {
        LockScreen().lockScreen()
    }
    @IBAction func checkBattery(_ sender: Any) {
        vitalChecker.getStatus()
    }
    @IBAction func quitClicked(_ sender: Any) {
        NSApplication.shared().terminate(self)
    }

}
