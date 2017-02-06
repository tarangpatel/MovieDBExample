//
//  Constants.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/1/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import Foundation
import Alamofire

enum Result<T> {
    case Success(T)
    case Failure(APPError)
}

enum APPError: Error {
    
    case NoInternet
    case HTTPError(statusCode: Int)
    case ServerError(message: String)
    case ApplicationError(message: String)
    case GeneralError(error: NSError)
}


struct Api {
    
    static let apiKey = "c1b6ad694b53fa8f984ad921bb327ad6"
    static let baseURL = "https://api.themoviedb.org/3/"
    
}


typealias UrlWithMethod = (Alamofire.HTTPMethod, String)

protocol ApiProtocol {
    func httpMethodUrl() -> UrlWithMethod
}

enum AuthenticationType {
    case createRequestToken
    case validateRequestToken
    case createSession
}

enum MovieApiType {
    case nowPlaying
    case popular
    case topRated
    case upcoming
}


extension AuthenticationType: ApiProtocol {
    
    func httpMethodUrl() -> UrlWithMethod {
        let apiURL = "\(Api.baseURL)authentication/"
        switch self {
        case .createRequestToken:
            return (.post, "\(apiURL)token/new?api_key=\(Api.apiKey)")
        case .validateRequestToken:
            return (.post, "\(apiURL)token/validate_with_login?api_key=\(Api.apiKey)")
        case .createSession:
            return (.post, "\(apiURL)session/new?api_key==\(Api.apiKey)")
            
        }
    }
}


extension MovieApiType: ApiProtocol {
    
    func httpMethodUrl() -> UrlWithMethod {
        let apiURL = "\(Api.baseURL)movie/"
    
        switch self {
        case .nowPlaying:
            return (.post, "\(apiURL)now_playing?api_key=\(Api.apiKey)")
        case .popular:
            return (.post, "\(apiURL)popular?api_key=\(Api.apiKey)")
        case .topRated:
            return (.post, "\(apiURL)top_rated?api_key=\(Api.apiKey)")
        case .upcoming:
            return (.post, "\(apiURL)upcoming?api_key=\(Api.apiKey)")
            
        }
    }
}

