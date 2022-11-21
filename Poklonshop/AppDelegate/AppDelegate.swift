//
//  AppDelegate.swift
//  Poklonshop
//
//  Created by Ognjen on 21.11.22..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        guard let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return false}
//
        let tabBar = TabBarViewController()
        
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        
        
        return true
    }
}

