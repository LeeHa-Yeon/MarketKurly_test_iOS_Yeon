//
//  AppDelegate.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/08.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //MARK: - TabBarTintColor 변경
        if #available(iOS 15, *) {
            let appearanceTB = UITabBarAppearance()
            let tabBar = UITabBar()
            appearanceTB.configureWithOpaqueBackground()
            appearanceTB.backgroundColor = .systemBackground
            tabBar.standardAppearance = appearanceTB;
            UITabBar.appearance().scrollEdgeAppearance = appearanceTB
            
            let appearanceNV = UINavigationBarAppearance()
            appearanceNV.configureWithOpaqueBackground()
            appearanceNV.backgroundColor = UIColor.mainKurlyPurple
            appearanceNV.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearanceNV.shadowColor = .clear
            
            UINavigationBar.appearance().standardAppearance = appearanceNV
            UINavigationBar.appearance().scrollEdgeAppearance = appearanceNV
            
        }

        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

