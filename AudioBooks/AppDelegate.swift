//
//  AppDelegate.swift
//  AudioBooks
//
//  Created by Carlos Roig on 13/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupInitialViewController()
        return true
    }

    func setupInitialViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController = UINavigationController.init(rootViewController: AudioBookDependencies.audioBooksContainerViewController())
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }

}

