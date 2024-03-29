//
//  AppDelegate.swift
//  3DTDemo
//
//  Created by Marius Constantinescu on 15/11/15.
//  Copyright © 2015 Marius Constantinescu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
    
    
    
    @available(iOS 9.0, *)
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        completionHandler(handleShortcut(shortcutItem))
    }
    
    @available(iOS 9.0, *)
    private func handleShortcut(shortcutItem: UIApplicationShortcutItem) -> Bool {
        
        if shortcutItem.type == "OpenFirstTab" {
            return selectTabBarItemWithIndex(0)
        } else if shortcutItem.type == "OpenSecondTab" {
            return selectTabBarItemWithIndex(1)
        } else if shortcutItem.type == "OpenThirdTab" {
            return selectTabBarItemWithIndex(2)
        }
        return false
    }
    
    
    private func selectTabBarItemWithIndex(index: Int) -> Bool {
        
        guard let tabBarController = self.window?.rootViewController as? UITabBarController else {
            return false
        }
        tabBarController.selectedIndex = index
        return true
    }


}

