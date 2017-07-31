//
//  AppDelegate.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/26.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = HQNavigationController(rootViewController: HQMainViewController())
//        window?.rootViewController = HQNavigationController(rootViewController: HQLoginController())
        window?.makeKeyAndVisible()
        
        setupNotification(application: application)
        
        return true
    }
}

extension AppDelegate {
    
    fileprivate func setupNotification(application: UIApplication) {
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound, .carPlay]) { (sucess, error) in
//                print("授权" + (sucess ? "成功" : "失败"))
            }
        } else {
            // Fallback on earlier versions
            let notificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(notificationSettings)
        }
    }
}

