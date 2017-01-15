//
//  SendEmail.swift
//  SecureCoffee
//
//  Created by John on 1/14/17.
//  Copyright © 2017 john. All rights reserved.
//

import Foundation
import UIKit


class SendEmail: NSObject {
    
    @IBAction func sendEmailButtonTapped(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
}
