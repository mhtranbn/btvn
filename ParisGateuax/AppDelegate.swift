//
//  AppDelegate.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate:  UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
        var tabBarBackGround : UIImage = UIImage(named: "tabbar.png")!
        UITabBar.appearance().backgroundImage = tabBarBackGround
        
            
            
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        var vc1 = MenuVC()
        var vc1a = UINavigationController(rootViewController:vc1)
        var vc2 = ContactVC()
        var vc2a = UINavigationController(rootViewController:vc2)
        var vc3 = ShopVC()
        var vc3a = UINavigationController(rootViewController:vc3)
        var vc4 = AboutVC()
        var vc4a = UINavigationController(rootViewController:vc4)
        
        var tab = UITabBarController()
        tab.viewControllers = [vc1a, vc2a, vc3a, vc4a]
        self.window?.rootViewController = tab
        let imagev1 = UIImage(named: "menu.png")
        let imagev2 = UIImage(named: "contact.png")
        let imagev3 = UIImage(named: "shop.png")
        let imagev4 = UIImage(named: "about.png")
        vc1.tabBarItem = UITabBarItem(title: "Menu", image: imagev1, tag: 1)
        vc2.tabBarItem = UITabBarItem(title: "Contact", image: imagev2, tag: 2)
        vc3.tabBarItem = UITabBarItem(title: "Shop", image: imagev3, tag: 3)
        vc4.tabBarItem = UITabBarItem(title: "About", image: imagev4, tag: 4)
        
        
        self.window?.makeKeyAndVisible()
//        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        return true
    }
    
    //func Cu


    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication!) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

