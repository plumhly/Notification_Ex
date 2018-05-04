//
//  NotificationViewController.swift
//  content_extension
//
//  Created by plum on 2018/5/3.
//  Copyright © 2018年 plum. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        if notification.request.content.threadIdentifier == "123" {
            
        }
        self.label?.text = notification.request.content.body
    
    }

}
