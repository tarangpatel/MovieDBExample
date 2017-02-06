//
//  MovieDetailViewModel.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/3/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import Foundation


class MovieDetailViewModel: ViewModelProtocol {
    
    let movie: Movie
    
    init(withMovie pmovie: Movie) {
        
        self.movie = pmovie
    }
    
    
}
