//
//  InitialViewContainer.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation
import UIKit

class InitialViewContainer {
    lazy var router = InitialViewRouter()
    lazy var presenter = InitialViewPresenter (router: router)
    
    func makeIntialViewController() -> InitialViewController {
        //get storyboard object
        let storyboard = UIStoryboard(name: Constants.CellIdentifiers.Main, bundle: nil)
        //get vc object from storyboard based on identifier
        let vc = storyboard.instantiateViewController(withIdentifier: Constants.CellIdentifiers.FirstScreen) as! InitialViewController
        vc.presenter = presenter
        // Dependency Inversion
        presenter.initialViewInterface = vc
        return vc
    }
}
