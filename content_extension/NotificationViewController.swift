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
    
    @IBOutlet var titleLable: UILabel!
    
    lazy var customView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 150))
        view.backgroundColor = .red
        
        let button = UIButton(type: UIButtonType.custom)
        button.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(clcik), for: .touchUpInside)
        view.addSubview(button)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        if response.actionIdentifier == "action"{
            self.becomeFirstResponder()
        }
    }
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
        self.titleLable?.text = notification.request.content.title
        
    }
    
    var mediaPlayPauseButtonFrame: CGRect {
        get {
            return CGRect(x: 0, y: 0, width: 100, height: 100)
        }
    }
    
    var mediaPlayPauseButtonType: UNNotificationContentExtensionMediaPlayPauseButtonType {
        return .default
    }
    
    var mediaPlayPauseButtonTintColor: UIColor {
        return .red
    }
    
    // custom input view
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputView: UIView? {
        return self.customView
    }
    
    
    @objc func clcik() {
        print("click")
         self.label?.text = "hi goodperson"
        self.resignFirstResponder()
    }
    
}
