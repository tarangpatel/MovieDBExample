//
//  MovieListViewModel.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/1/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import Foundation

enum SegmentType: Int {
    case nowplaying = 0
    case popular
    case topRated
    case upcoming
}

protocol MovieListProtocol: ViewModelProtocol {
    
    var page: Dynamic<Int> { get }
    var dates: Dynamic<[String: Any]> { get }
    var totalPages: Dynamic<Int> { get }
    var totalResults: Dynamic<Int> { get }
    
    func getMovieList(_ apiType: MovieApiType) 
}


class MovieListViewModel: MovieListProtocol {
    
    var movies = [Movie]()
    var page: Dynamic<Int>
    var dates: Dynamic<[String: Any]>
    var totalPages: Dynamic<Int>
    var totalResults: Dynamic<Int>
    
    let movieListStore = MovieListStore()

    init() {
        self.dates = Dynamic([String: Any]())
        self.page = Dynamic(0)
        self.totalResults = Dynamic(0)
        self.totalPages = Dynamic(0)
    }
    
    func getMovieList(_ apiType: MovieApiType) {
        
        self.movieListStore.getMovies(apiType) { [unowned self] response in
            
            switch response {
            case .Success(let result):
                
                guard let list = result.results else { return }
                self.movies = list
                
                guard let p = result.page else { return }
                self.page.value = p
                
            case .Failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func segmentSelected(type: String) {
     
        switch  type {
            
        case SegmentType.nowplaying.rawValue : self.getMovieList(.nowPlaying)
            break
        case SegmentType.popular.rawValue: self.getMovieList(.popular)
            break
        case SegmentType.topRated.rawValue: self.getMovieList(.topRated)
            break
        case SegmentType.upcoming.rawValue: self.getMovieList(.upcoming)
            break
        default:
            break
        }
    }
    
    func showMovieDetail(atIndex: Int) {
        
        let movie = self.movies[atIndex]

        AppNavigator.navigator.navigateTo(destination: MovieDetailViewController(),
                                 navigationType: .push,
                                 viewModel: MovieDetailViewModel(withMovie: movie))
        
    }

}
