//
//  MovieListStore.swift
//  MovieDBExample
//
//  Created by Tarang Patel on 2017-02-06.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import Foundation

struct MovieListStore {
    
    func getMovies(_ apiType: MovieApiType, callback:@escaping (Result<Movies>) -> Void) {
        
        // logic is to be implemented in case of caching of data 
        
        NetworkService().get(apiUrl: apiType, request: nil) { response in
            
            callback(response)
        }
    }
}
