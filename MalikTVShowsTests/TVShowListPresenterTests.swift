//
//  TVShowListPresenterTests.swift
//  MalikTVShowsTests
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import XCTest
@testable import MalikTVShows

class TVShowListPresenterTests: XCTestCase {
    
    class MockInteractor: TVShowListInteractor {
        override func loadTVShows() {
        }
    }
    
    class MockRouter: TVShowListRouting {
        func goBackToInitialScreen() {
        }
        var showsList: [TVShow]?
        
        func refreshTVShowList(with shows: TVShowContent) {
            showsList = shows.results;
        }
    }
    
    class MockInterface: TVShowListViewInterface {
        var shouldLoadMovieList = false
        var shouldShowError = false
        
        func showLoadingError(errorMessage: String) {
            shouldShowError = true
        }
        
        func refreshTVShows() {
            shouldLoadMovieList = true
        }
    }
    
    var presenter: TVShowListPresenter?
    let mockInteractor = MockInteractor()
    let mockRouter = MockRouter()
    var fakeTvContent:TVShowContent?;
    var mockInterface: MockInterface?
    
    func MakeFakeTVContent() -> TVShowContent? {
        var tvShow = TVShow();
        tvShow.name = "Don't Give Up"
        tvShow.overview = "I will fight,I will fight for me"
        tvShow.poster_path = "​https://image.tmdb.org/t/p/w500/​"
        tvShow.first_air_date = "1/1/2020"
        var tvshowContent = TVShowContent();
        tvshowContent.page = 1;
        tvshowContent.total_pages = 30;
        tvshowContent.results = [tvShow];
        return tvshowContent
    }
    
    override func setUp() {
        super.setUp()
        presenter = TVShowListPresenter(interactor: mockInteractor, router: mockRouter)
        mockInterface = MockInterface()
        presenter?.tvShowListViewInterface = mockInterface
        fakeTvContent = MakeFakeTVContent();
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTVShowCountIs1() {
        presenter?.refreshTVShowList(with: fakeTvContent!)
        XCTAssertEqual(presenter?.showCount, 1)
    }
    
    func testItemAtIndexIsInjectedTVShowContent() {
        presenter?.refreshTVShowList(with: fakeTvContent!)
        let tvshow = presenter?.show(at: 0)
        XCTAssertEqual(tvshow?.name, "Don't Give Up")
        XCTAssertEqual(tvshow?.overview, "I will fight,I will fight for me")
        XCTAssertEqual(tvshow?.first_air_date,"1/1/2020")
    }
    
    func testShowListEmptyShouldShowList() {
        presenter?.refreshTVShowList(with: fakeTvContent!)
        XCTAssertEqual(mockInterface?.shouldShowError,
                       false)
        XCTAssertEqual(mockInterface?.shouldLoadMovieList,
                       true)
    }
}
