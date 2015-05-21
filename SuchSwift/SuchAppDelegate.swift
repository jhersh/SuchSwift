//
//  SuchAppDelegate.swift
//  SuchSwift
//
//  Created by Jonathan Hersh on 6/4/14.
//  Copyright (c) 2014 JH. All rights reserved.
//

import UIKit

@UIApplicationMain
class SuchAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.rootViewController = SuchViewController()
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }
}

