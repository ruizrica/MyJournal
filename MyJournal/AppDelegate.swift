//
//  AppDelegate.swift
//  MyJournal
//
//  Created by Ricardo Ruiz on 6/7/17.
//  Copyright © 2017 Ricardo Ruiz. All rights reserved.


import UIKit

// Import Parse Framework
// - - - - - - - - - - - - - - - - - - - -
// Download Parse Framework From:
// https://tinyurl.com/y7gquj7m
//

import Parse

// Required Frameworks
// https://stackoverflow.com/a/18319944
// - - - - - - - - - - - - - - - - - - - -
// AudioToolbox.framework
// CFNetwork.framework
// CoreGraphics.framework
// CoreLocation.framework
// libz.1.1.3.dylib
// MobileCoreServices.framework
// QuartzCore.framework
// Security.framework
// StoreKit.framework
// SystemConfiguration.framework
// libsqlite3.tbd
//
//
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // API CONSTANTS
    // - - - - - - - - - - - - - - - - - - - - - -
    // - - - - - - - - - - - - - - - - - - - - - -
    // - - - - - - - - - - - - - - - - - - - - - -
    // https://stackoverflow.com/a/35089932
    //
    let applicationId = "af74f915-ff5d-4795-82ee-b6ac8a1ba242"
    let clientKey = "l1FTKSBmKtp26ZxE0UY97LW6T8VmPn2U"
    // Also Remember to Allow Transport Security
    let server = "https://parse.buddy.com/parse"
    // - - - - - - - - - - - - - - - - - - - - - -
    // - - - - - - - - - - - - - - - - - - - - - -
    // - - - - - - - - - - - - - - - - - - - - - -

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Parse Server Configuration
        let parseConfiguration = ParseClientConfiguration(block: { (ParseMutableClientConfiguration) -> Void in
            ParseMutableClientConfiguration.applicationId = self.applicationId
            ParseMutableClientConfiguration.clientKey = self.clientKey
            ParseMutableClientConfiguration.server = self.server
        })
        
        Parse.initialize(with: parseConfiguration)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

