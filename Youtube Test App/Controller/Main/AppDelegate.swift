//
//  AppDelegate.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 13.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        //layout
        let layout = UICollectionViewFlowLayout()
        let home = HomeController(collectionViewLayout: layout)
        
        window?.rootViewController = UINavigationController(rootViewController: home)
        
        //nav bar
        UINavigationBar.appearance().barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        //hide nav bar bottom separator
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        //status bar
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31)
        UIApplication.shared.statusBarStyle = .lightContent
        
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


}

