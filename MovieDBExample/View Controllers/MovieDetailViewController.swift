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
        didSet {
            print("View model is set")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
