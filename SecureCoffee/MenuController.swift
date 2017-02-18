//
//  MenuController.swift
//  SecureCoffee
//
//  Created by John on 1/9/17.
//  Copyright © 2017 john. All rights reserved.
//

import Cocoa

var loggedBackIn = 0;

class MenuController: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var activeSelection: NSMenuItem!
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    let instanceOfSendText: SendText = SendText()
    let prefPane = PreferencesWindow()
    let vitalChecker = CheckVitals()
    
    override func awakeFromNib() {
        statusItem.menu = statusMenu
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = false // best for dark mode
        statusItem.image = icon
        
        instanceOfSendText.setNewNumber(defaults.object(forKey: "phoneNumber") as! String!)
        activeSelection.state =  defaults.integer(forKey: "isActive")
    }
    
    
    /* check to see if user has entered phone number; if so, activate the service */
    @IBAction func activeCheck(_ sender: Any) {
        
        if (defaults.integer(forKey: "isActive") == 1) {
            activeSelection.state = 0
            defaults.set(0, forKey: "isActive")
        } else if (defaults.integer(forKey: "isActive") == 0 &&
            defaults.bool(forKey: "numberIsSet") == false) {
            
            let alert = NSAlert()
            alert.messageText = "You need to setup a phone number before you can activate SecureCoffee!"
            alert.addButton(withTitle: "OK")
            alert.alertStyle = NSAlertStyle.warning
            alert.runModal()
            
        } else {
            defaults.set(1, forKey: "isActive")
            activeSelection.state = 1
        }
    }
    
    
    /* show prefs window if clicked */
    @IBAction func clickPrefs(_ sender: Any) {
        prefPane.showWindow(nil)
        
    }

    @IBAction func aboutSecureCoffee(_ sender: Any) {
        let alert = NSAlert()
        alert.messageText = "To use SecureCoffee, first click on Preferences and add a phone number. Then, click the 'Active' menu-item to enable system logging. When you want the logging to get to work, simply select 'Lock Machine' and SecureCofee will keep you protected!"
        alert.addButton(withTitle: "OK")
        alert.alertStyle = NSAlertStyle.informational
        alert.runModal()
    }
    
    /* lock computer when menu item is clicked */
    @IBAction func lockComputer(_ sender: Any) {
         loggedBackIn = 0;
        LockScreen().lockScreen()
        
        let backgroundThreadUno = DispatchQueue.global()
        let backgroundThreadDos = DispatchQueue.global()

        
        if (activeSelection.state == 1) {
            SleepChecker.caller()
            
            backgroundThreadUno.async {
                self.vitalChecker.watchMovement()
            }
            backgroundThreadDos.async {
                self.vitalChecker.getStatus()
            }
        }
        
        
        if (activeSelection.state == 1) {
            let endActivity = NSAlert()
            endActivity.messageText = "Welcome back! Press OK to background SecureCoffee."
            endActivity.addButton(withTitle: "OK")
            endActivity.alertStyle = NSAlertStyle.warning
            
            if (endActivity.runModal() == NSAlertFirstButtonReturn) {
                loggedBackIn = 1;
            }
        }
    }
    
    
    /* close application with quit button is clikced */
    @IBAction func quitClicked(_ sender: Any) {
        NSApplication.shared().terminate(self)
    }
}
