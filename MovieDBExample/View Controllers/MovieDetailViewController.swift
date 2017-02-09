//
//  MovieDetailViewController.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/3/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController, ViewControllerProtocol {

    var viewModel: ViewModelProtocol! {
        didSet{
            self._viewModel = viewModel as! MovieDetailViewModel
        }
    }
    
    var _viewModel: MovieDetailViewModel

    
    init() {
        self._viewModel = MovieDetailViewModel(withMovie: Movie(JSON: [:])!)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self._viewModel = MovieDetailViewModel(withMovie: Movie(JSON: [:])!)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = _viewModel.movie.original_title
    }
    
}
