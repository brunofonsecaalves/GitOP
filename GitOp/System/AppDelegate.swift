//
//  AppDelegate.swift
//  GitOp
//
//  Created by Bruno Alves on 05/02/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = HomeTabBarController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }

}

