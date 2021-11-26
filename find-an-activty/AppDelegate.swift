//
//  AppDelegate.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 25/11/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var coordinator: AppCoordinator = AppCoordinator(appDelegate: self, window: window!)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator.start()
        return true
    }

}

