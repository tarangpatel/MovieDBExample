//
//  Constants.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/1/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import Foundation


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
    static let imageURL500Base = "https://image.tmdb.org/t/p/w500"
}


