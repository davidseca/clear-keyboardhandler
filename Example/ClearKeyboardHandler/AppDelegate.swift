//
//  AppDelegate.swift
//  ClearKeyboardHandler
//
//  Created by David Seca on 27.06.22.
//  Copyright (c) 2022 David Seca. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = .systemBackground
        self.window?.rootViewController = SampleViewController()

        return true
    }

}

