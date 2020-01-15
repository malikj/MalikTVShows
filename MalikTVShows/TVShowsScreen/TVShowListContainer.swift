//
//  TVShowListContainer.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation
import UIKit

class TVShowListContainer {
    lazy var interactor = TVShowListInteractor()
    lazy var router = TVShowListRouter()
    lazy var presenter = TVShowListPresenter(interactor: interactor, router: router)
    
    func makeTVShowListViewController() -> TVShowListViewController {
        //get vc object from storyboard based on identifier
        let view = UIStoryboard(name: Constants.CellIdentifiers.Main, bundle: nil).instantiateViewController(withIdentifier: Constants.CellIdentifiers.TVShowsListScreen) as! TVShowListViewController
        view.presenter = presenter
        presenter.tvShowListViewInterface = view
        interactor.output = presenter
        return view
    }
}
