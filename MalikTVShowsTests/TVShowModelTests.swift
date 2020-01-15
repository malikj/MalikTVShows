//
//  TVShowModelTests.swift
//  MalikTVShowsTests
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import XCTest
@testable import MalikTVShows

class TVShowModelTests: XCTestCase {

    func testTVShowModelSetGet() {
        var tvShow = TVShow();
        tvShow.name = "Don't Give Up"
        tvShow.overview = "I will fight,I will fight for me"
        tvShow.poster_path = "​https://image.tmdb.org/t/p/w500/​"
        tvShow.first_air_date = "1/1/2020"

        XCTAssertEqual(tvShow.name, "Don't Give Up")
        XCTAssertEqual(tvShow.overview, "I will fight,I will fight for me")

        var tvshowContent = TVShowContent();
        tvshowContent.page = 1;
        tvshowContent.total_pages = 30;
        tvshowContent.results = [tvShow];
        
        XCTAssertEqual(tvshowContent.page, 1)
        XCTAssertEqual(tvshowContent.total_pages, 30)
        XCTAssertEqual(tvshowContent.results?.count, 1)
    }
}
