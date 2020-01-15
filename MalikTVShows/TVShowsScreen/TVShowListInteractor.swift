//
//  TVShowListInteractor.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation


// MARK:- Interaction Protocol
protocol TVShowListInteraction {
    func loadTVShows()
}

// MARK:- Interaction -> Presenter Protocol
protocol TVShowListInteractionOutput: class {
    func refreshTVShowList(with shows: TVShowContent)
    func showError(_ error: TVShowsErrorType)
}

// MARK:- Interactor
class TVShowListInteractor : TVShowListInteraction {
    
    var tvShowContent : TVShowContent?
    private let tvShowService: TVShowService
    weak var output: TVShowListInteractionOutput?

    /// Init
    init(service: TVShowService = TVShowService.shared) {
        self.tvShowService = service
    }
    
    func loadTVShows() {
        let params : [String : String] = ["api_key" : Constants.APIBuilder.apiKey, "language" :  Constants.APIBuilder.language, "page" :  Constants.APIBuilder.page]
        self.tvShowService.getTVShows(url:  Constants.APIBuilder.tvShowsURL, parameters: params) { (result) in
            switch result {
            case .success(let tvShowContent):
                self.tvShowContent = tvShowContent
                self.output?.refreshTVShowList(with: self.tvShowContent!)
            case .failure(let errorType):
                self.output?.showError(errorType as! TVShowsErrorType)
            }
        }
    }
}
