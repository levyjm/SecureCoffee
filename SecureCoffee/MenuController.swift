//
//  MenuController.swift
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

import Cocoa

class MenuController: NSObject, NSApplicationDelegate {
    
    let prefPane = PreferencesWindow()
    
    // create a CheckVitals Object
    let vitalChecker = CheckVitals()
    
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    override func awakeFromNib() {
        statusItem.title = "Secure Coffee"
        statusItem.menu = statusMenu
    }
    
    @IBAction func clickPrefs(_ sender: Any) {
        prefPane.showWindow(nil)
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
