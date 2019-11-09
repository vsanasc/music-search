//
//  AppDelegate.swift
//  MusicSearch
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import UIKit
import MusicSearchIOS

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let appDependencyContainer = MusicSearchAppDependencyContainer()
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let root = appDependencyContainer.makeRootViewController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = root
        window?.makeKeyAndVisible()

        return true
    }

}
