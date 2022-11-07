//
//  AppDelegate.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let baseTabbarController = BaseTabbarController()
        window?.rootViewController = baseTabbarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func navigationSet(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGray5
        UINavigationBar.appearance().standardAppearance = appearance;
      //  UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance
       // appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
       // appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}



/*
 Remove SceneDelegate.swift file
 Remove Application Scene Manifest from Info.plist file
 Remove UISceneSession Lifecycle function from your AppDelegate class
 Add var window: UIWindow? in your AppDelegate class as a instance property
 Replace @main attribute with @UIApplicationMain attribute (This saves as to manually create and assign window)
 */
