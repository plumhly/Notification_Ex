//
//  NotificationService.swift
//  noti_extension
//
//  Created by plum on 2018/5/3.
//  Copyright © 2018年 plum. All rights reserved.
//

import UserNotifications
import UserNotificationsUI

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        if let bestAttemptContent = bestAttemptContent {
            // Modify the notification content here...
            bestAttemptContent.title = "\(bestAttemptContent.title) [modified]"
           
            let url = Bundle.main.url(forResource: "attach_image", withExtension: "png")!
            
            do {
                let atta = try UNNotificationAttachment(identifier: "picture", url: url, options: nil)
                bestAttemptContent.attachments = [atta]
            } catch let error as NSError {
                print(error)
            }
            contentHandler(bestAttemptContent)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}
