//
//  InitialViewRouter.swift
//  MalikTVShows
//
//  Created by malikj on 13/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation

protocol InitialViewRouting: class {
    /// The  View controller to push onto the stack to display Shows List
    func presentTVShowsList()
}

class InitialViewRouter: Router, InitialViewRouting {
    var container = TVShowListContainer()
    func presentTVShowsList() {
        let showListVC = container.makeTVShowListViewController()
        guard let rootVC = rootNavController else { return }
        rootVC.pushViewController(showListVC, animated: true)
    }
    
}
