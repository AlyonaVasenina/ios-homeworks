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
        result.viewControllers = [feedNavVC, profileNavVC]
        return result
    }()
    
    private lazy var feedNavVC: UINavigationController = {
        let feed = UINavigationController(rootViewController: feedVC)
        feed.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house"), tag: 0)
        return feed
    }()
    
    private lazy var profileNavVC: UINavigationController = {
        let profile = UINavigationController(rootViewController: profileVC)
        profile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 1)
        return profile
    }()
    
    private lazy var feedVC: UIViewController = {
        let feed = UIViewController()
        feed.title = "Home"
        return feed
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

