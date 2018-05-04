//
//  ViewController.swift
//  Notification_Ex
//
//  Created by plum on 2018/4/28.
//  Copyright © 2018年 plum. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let uncenter = UNUserNotificationCenter.current()
        uncenter.getNotificationSettings { (settings) in
            let a = settings.soundSetting.rawValue
            let b = settings.alertSetting.rawValue
            print()
        }
        
        
//        let request = localNotification_Now()
//        uncenter.add(request) { (error) in
//            if let e = error {
//                print(e)
//            }
//        }
        
    }
    
    func localNotification_Now() -> UNNotificationRequest {
        let content = UNMutableNotificationContent()
        content.body = "hello"
        content.title = "plum"
        content.categoryIdentifier = "PLUM"
        content.sound = UNNotificationSound.default()
        
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
        
        return UNNotificationRequest(identifier: "PLUM", content: content, trigger: triger)
    }
    
    func localNotification_Pre() {
        let localNotification = UILocalNotification()
        localNotification.fireDate = Date(timeIntervalSinceNow: 5)
        
        localNotification.alertBody = "alertBody"
        localNotification.alertTitle = "title"
        localNotification.alertAction = "action"
        
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.applicationIconBadgeNumber = 1
        
        localNotification.userInfo = ["name": "plum"]
        
        UIApplication.shared.scheduleLocalNotification(localNotification)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

