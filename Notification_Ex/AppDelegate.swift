//
//  AppDelegate.swift
//  Notification_Ex
//
//  Created by plum on 2018/4/28.
//  Copyright © 2018年 plum. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let options = launchOptions {
            let userinfo = options[UIApplicationLaunchOptionsKey.localNotification]
            if let info = userinfo {
                print(info)
            }
        }
        
        
        let userNotificationCenter = UNUserNotificationCenter.current()
        userNotificationCenter.delegate = self
        userNotificationCenter.requestAuthorization(options: [.badge, .alert, .sound]) { (grant, error) in
            if (grant) {
                print("success")
            }
        }
        
        let action1 = UNNotificationAction(identifier: "action1", title: "plum1", options: .foreground)
        let action2 = UNNotificationAction(identifier: "action2", title: "plum2", options: .foreground)
        let action3 = UNNotificationAction(identifier: "action3", title: "plum3", options: .foreground)
        let action4 = UNNotificationAction(identifier: "action4", title: "plum4", options: .foreground)
        let myCategory = UNNotificationCategory(identifier: "PLUM", actions: [action1, action2, action3, action4], intentIdentifiers: ["identifier"], options: [])
        userNotificationCenter.setNotificationCategories([myCategory])
        
//        let url: URL?
//        url?.startAccessingSecurityScopedResource()
        UIApplication.shared.registerForRemoteNotifications()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map{String(format: "%02.2hhx", $0)}.joined()
        debugPrint(token)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if let name = userInfo["name"] {
            UserDefaults.standard.set(name, forKey: "name")
        }
        
        print()
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        
    }

    
    //MARK: - UNUserNotificationCenterDelegate

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        center.getDeliveredNotifications { (nts) in
//            print(nts)
//        }
        completionHandler([.alert, .badge])
    }
}

