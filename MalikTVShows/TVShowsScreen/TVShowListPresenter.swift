//
//  TVShowListPresenter.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation

// MARK:- TVShows List Presentation Protocol
protocol TVShowListPresentation: class {
    /// Number of TVShow Objects
    var showCount: Int { get }
    
    /// Get show item from array of Objects
    /// - parameter intValue: The integer value of the desired key.
    func show(at index: Int) -> TVShow?
    
    ///  Get TVShow content from web service
    func loadTVShows()
    
    /// Sort array of TVShows Objects alphabetically
    func sortedShows();
    
   /// Shuffled array  of TVShows Objects
    func clear();
}

// MARK:- Presenter -> View Interface
protocol TVShowListViewInterface: class {
    /// Refresh TV Show List
    func refreshTVShows()
    /// Display error with message
    func showLoadingError(errorMessage: String)
}

class TVShowListPresenter :TVShowListPresentation {
    
    // MARK: Init
    private var interactor: TVShowListInteraction
    private let router: TVShowListRouting
    private let tvShowService: TVShowService
    
    weak var tvShowListViewInterface: TVShowListViewInterface?

    init(interactor: TVShowListInteraction, router: TVShowListRouting, tvshowService: TVShowService = TVShowService.shared) {
           self.interactor = interactor
           self.router = router
           self.tvShowService = tvshowService
       }
    
    var showCount: Int {
        return showsList?.count ?? 0
    }
    
    func show(at index: Int) -> TVShow? {
        return showsList?[index] ?? nil
    }
    
    private(set) var showsList: [TVShow]? {
        didSet {
            guard let showList = showsList, !((showList.count == 0)) else {
                tvShowListViewInterface?.showLoadingError(errorMessage: Constants.ErrorMessage.NoTVShows)
                return
            }
            tvShowListViewInterface?.refreshTVShows()
        }
    }
    
    func loadTVShows() {
        interactor.loadTVShows()
    }
    
    func sortedShows() {
        let sortedList  = showsList?.sorted(by: { (Obj1, Obj2) -> Bool in
           let Obj1_Name = Obj1.name ?? ""
           let Obj2_Name = Obj2.name ?? ""
           return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedAscending)
        })
        showsList = sortedList;
    }
    
    func clear() {
        let unsortedList = showsList?.shuffled()
        showsList = unsortedList;
    }
    
}

// MARK: - TVShowListInteractionOutput

extension TVShowListPresenter: TVShowListInteractionOutput {
    
    func refreshTVShowList(with shows: TVShowContent) {
        showsList = shows.results
    }
    
    func showError(_ error: TVShowsErrorType) {
        tvShowListViewInterface?.showLoadingError(errorMessage: Constants.ErrorMessage.ErrorOccured)
    }
    
}
