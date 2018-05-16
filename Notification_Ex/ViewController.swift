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
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let namme = UserDefaults.standard.value(forKey: "name") {
            label.text = namme as? String
        }
        
        let uncenter = UNUserNotificationCenter.current()
        createLocalNotification()
        
    }
    
    func createLocalNotification() {
        let content = UNMutableNotificationContent()
        content.body = "hello"
        content.title = "plum"
        content.categoryIdentifier = "PLUM"
        content.launchImageName = "screenshot01@2x.png"
        content.sound = UNNotificationSound.default()
        
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
        let request = UNNotificationRequest(identifier: "PLUM", content: content, trigger: triger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let er = error {
                print(er)
            }
        }
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
    
 
    @IBAction func addNo(_ sender: UIButton) {
        let center = UNUserNotificationCenter.current()
        center.getDeliveredNotifications { (notifications) in
            notifications.forEach({ (noti) in
                print(noti.request.content.title)
                let title = noti.request.content.title
            })
        }
        
    }
    
    @IBAction func removeNo(_ sender: UIButton) {
        
    }
    
    @IBAction func update(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
        content.body = "hello_update"
        content.sound = UNNotificationSound.default()
        
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
        
        let request = UNNotificationRequest(identifier: "PLUM", content: content, trigger: triger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}

