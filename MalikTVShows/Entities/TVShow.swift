//
//  TVShow.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation

struct TVShowContent: Codable {
    var page: Int?
    var total_results: Int?
    var total_pages: Int?
    var results: [TVShow]?
}

struct TVShow: Codable {
    var name: String?
    var overview: String?
    var first_air_date:String?
    var poster_path: String?
}
