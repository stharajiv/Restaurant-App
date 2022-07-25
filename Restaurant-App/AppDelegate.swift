//
//  AppDelegate.swift
//  Restaurant-App
//
//  Created by Rajiv Shrestha on 7/25/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
    #if compiler(>=5.1)
      if #available(iOS 13.0, *) {
        // Always adopt a light interface style.
        window?.overrideUserInterfaceStyle = .light
      }
    #endif
        
        return true
    }
    
    class func sharedAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}

