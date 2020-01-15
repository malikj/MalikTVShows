//
//  TVShowService.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation
import Alamofire

public enum TVShowsErrorType: Error {
    case noInternet
    case fail
}

class TVShowService {
    
    static var shared = TVShowService()
        
    //MARK: NETWORKING FOR TVSHOWS
    ///    The main networking call, which will run asynchronously to to retrieve the contents of the specified `url`.
    ///   - Parameter url:           The `Top Rated Shows Base URL` value.
    ///   - parameter parameters:    The `Parameters`, apiKey,  language, page etc..
    ///   - returns:    A completion block containing the TVShowContent  or Error after the networking call is completed, this will be called on the main thread Result<TVShowContent, Error>
    func getTVShows(url: String, parameters: [String : String], result: @escaping ((Result<TVShowContent, Error>)) -> Void){
        AF.request(url,method: .get, parameters: parameters).responseData{ response in
            switch response.result {
            case .success:
                guard let jsonData = response.data, let _ = response.value, let articleContent = try?  JSONDecoder().decode(TVShowContent.self, from: jsonData) else {
                    fallthrough
                }
                result(.success(articleContent))
            case .failure:
                result(.failure(TVShowsErrorType.fail))
            }
        }
    }
}
