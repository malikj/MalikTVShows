//
//  RootViewControllerGettable.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    var rootViewController: UIViewController?{
        if keyWindow?.rootViewController == nil{
            return keyWindow?.rootViewController
        }
        var pointedViewController = keyWindow?.rootViewController
        while  pointedViewController?.presentedViewController != nil {
            switch pointedViewController?.presentedViewController {
            case let navagationController as UINavigationController:
                pointedViewController = navagationController.viewControllers.last
            case let tabBarController as UITabBarController:
                pointedViewController = tabBarController.selectedViewController
            default:
                pointedViewController = pointedViewController?.presentedViewController
            }
        }
        return pointedViewController
    }
}

protocol RootViewControllerGettable  {
    var rootViewController: UIViewController? { get }
    var rootNavController: UINavigationController? { get }
}

extension RootViewControllerGettable {
    var rootViewController: UIViewController? {
        return UIApplication.shared.rootViewController
    }
    
    var rootNavController: UINavigationController? {
        return UIApplication.shared.rootViewController as? UINavigationController
    }
}
