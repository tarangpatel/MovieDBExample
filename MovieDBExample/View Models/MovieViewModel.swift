//
//  MovieViewModel.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/2/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import Foundation
import UIKit

class MovieViewModel {
    
    var movieImage: UIImage?
    var movieReleaseDate: String
    var movieTitle: String
    var movieDescription: String
    var movieRating: String
    var moviewImageURL: String

    init(_ model: Movie) {
        
        self.movieDescription = model.overview ?? "No description available"
        self.movieRating = "\(model.vote_average ?? 0)"
        self.movieTitle = model.original_title ?? "N/A"
        self.movieReleaseDate = model.release_date ?? "N/A"
        self.moviewImageURL = "https://image.tmdb.org/t/p/w500\(model.poster_path ?? "")"
    }

}
