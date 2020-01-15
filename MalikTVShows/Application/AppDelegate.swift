//
//  AppDelegate.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        navigateToRootView();
        return true
    }
    
    private func navigateToRootView() {
        setupNavigationColor()
        window = UIWindow()
        window?.makeKeyAndVisible()
        let container = InitialViewContainer()
        window?.rootViewController = UINavigationController(rootViewController: container.makeIntialViewController())
    }
    
    func setupNavigationColor() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = Constants.Colors.uicolorFromHex(rgbValue: 0xffffff)
        navigationBarAppearace.barTintColor = Constants.Colors.uicolorFromHex(rgbValue: 0x034517)
    }

}

