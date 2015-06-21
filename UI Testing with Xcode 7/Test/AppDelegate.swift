//
//  AppDelegate.swift
//  Test
//
//  Created by Laurin Brandner on 15/06/15.
//  Copyright © 2015 Laurin Brandner. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        if NSProcessInfo.processInfo().environment["animations"] == "0" {
            UIView.setAnimationsEnabled(false)
        }
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.backgroundColor = .whiteColor()
        window?.makeKeyAndVisible()
        
        return true
    }

}

