//
//  Constants.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation
import UIKit

public enum Constants {
    enum APIBuilder {
        static let apiKey = "25a8f80ba018b52efb64f05140f6b43c"
        static let language = "en-US"
        static let page = "1"
        static let tvShowsURL = "https://api.themoviedb.org/3/tv/top_rated"
        static let imageBaseURL = "http://image.tmdb.org/t/p/w185"
    }
    
    enum CellIdentifiers {
        static let Main = "Main"
        static let FirstScreen = "InitialViewController"
        static let TVShowsListScreen = "TVShowListViewController"
        static let TVShowTableViewCell = "TVShowCell"
    }
    
    enum Titles {
        static let Title = "Top Shows"
        static let Sort = "Sort"
        static let Clear = "Clear"
    }
    
    enum ErrorMessage {
        static let ErrorOccured = "Some Error occured"
        static let NoTVShows  = "No TVShows Loaded"
    }
    
    enum Size {
        static let TableViewHeight: CGFloat = 150
        static let spinnerHeight: CGFloat = 40
        static let spinnerWidth: CGFloat = 40
    }
    
    enum Colors {
        static let refreshControlColor = UIColor(red:0.25, green:0.72, blue:0.25, alpha:1.0)
        static func uicolorFromHex(rgbValue:UInt32)->UIColor{
            let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
            let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
            let blue = CGFloat(rgbValue & 0xFF)/256.0
            return UIColor(red:red, green:green, blue:blue, alpha:1.0)
        }
    }
}

