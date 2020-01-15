//
//  TVShowListRouter.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation

protocol TVShowListRouting: class {
    ///  Return to the Previous ViewController :
    func goBackToInitialScreen()
}

class TVShowListRouter : Router, TVShowListRouting{
    func goBackToInitialScreen() {
        guard let rootVC = rootNavController else { return }
        rootVC.popViewController(animated: true)
    }
}
