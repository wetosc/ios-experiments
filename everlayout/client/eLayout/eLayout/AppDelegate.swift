//
//  AppDelegate.swift
//  eLayout
//
//  Created by Eugeniu Cernei on 3/16/17.
//  Copyright © 2017 Eugeniu Cernei. All rights reserved.
//

import UIKit
import EverLayout

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        EverLayoutBridge.connectToLayoutServer()
        return true
    }
}

