//
//  AppDelegate.swift
//  TableViewAddAndDeleteRows
//
//  Created by Michael Miles on 3/8/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        let nav = UINavigationController()
        nav.viewControllers = [ViewController()]
        window?.makeKeyAndVisible()
        window?.rootViewController = nav
        
        return true
    }


}

