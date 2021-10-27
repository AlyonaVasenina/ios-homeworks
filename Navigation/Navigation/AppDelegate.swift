//
//  AppDelegate.swift
//  Navigation
//
//  Created by Alena Vasenina on 26.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private lazy var tabBarController: UITabBarController = {
        let result = UITabBarController()
        result.viewControllers = [FeedNavVC(), profileNavVC]
        return result
    }()
    
    private lazy var profileNavVC: UINavigationController = {
        let profile = UINavigationController(rootViewController: profileVC)
        profile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 1)
        return profile
    }()
    
    private lazy var profileVC: UIViewController = {
        let profile = UIViewController()
        profile.title = "Profile"
        return profile
    }()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = tabBarController
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

