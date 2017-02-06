//
//  NetworkService.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/1/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

protocol Gettable {
    associatedtype GetData
    
    func get (apiUrl: ApiProtocol, request: AnyObject?, completion: @escaping (Result<GetData>) -> Void)
}

protocol Postable {
    associatedtype PostData
    
    func post (apiUrl: ApiProtocol, request: AnyObject?, completion: @escaping (Result<PostData>) -> Void)
}

final class NetworkService: Gettable  {
    
    
    func get(apiUrl: ApiProtocol, request: AnyObject?, completion: @escaping (Result<Movies>) -> Void) {
        
        let (method, url) = apiUrl.httpMethodUrl()
        
        Alamofire.request(url, method: method)
            .validate()
            .responseJSON { response in
                
                switch response.result {
                case .success:
                    
                    guard let jsonValue = response.result.value else { return }
                        
                    guard let movieList = Mapper<Movies>().map(JSONObject: jsonValue) else { return }
                    
                    completion(Result.Success(movieList))
                    
                    
                case .failure(let error):
                    print(error)
                    completion(Result.Failure(APPError.ServerError(message: error.localizedDescription)))
                }
                
            }
        
    }
}
