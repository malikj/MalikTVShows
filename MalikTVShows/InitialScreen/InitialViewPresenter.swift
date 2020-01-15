//
//  InitialViewPresenter.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation
import UIKit

// MARK:- Presenter -> View Interface
protocol InitialViewInterface: class {
    func goButtonClicked(_ sender: UIButton);
}

// MARK:- Initial View Presentation Protocol
protocol InitialViewPresentation {
  func openTVShowListScreen()
}

class InitialViewPresenter : InitialViewPresentation {
    
    // MARK: Init
    weak var initialViewInterface: InitialViewInterface?
    
    private let router: InitialViewRouting
    init(router: InitialViewRouting) {
        self.router = router
    }
    
    func openTVShowListScreen() {
        self.router.presentTVShowsList()
    }

}
