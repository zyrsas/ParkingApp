//
//  AppDelegate.swift
//  ParkingApp
//
//  Created by Sasha on 5/10/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // Create ViewController in AppDelegate with lazy var
    private(set) lazy var viewController = ViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey(Constants.MAPAPIKEY)

        // Create the application window
        self.window = UIWindow(frame: UIScreen.main.bounds)

        // Set navigation controller
        let navigationController = UINavigationController(rootViewController: viewController)

        // Set root view controller for window
        self.window?.rootViewController = navigationController

        // Set window visibility
        self.window?.makeKeyAndVisible()

        return true
    }

}
