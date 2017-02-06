//
//  MovieTableViewCell.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/2/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    @IBOutlet weak var movieRating: UILabel!
    
    
    func configure(_ viewModel: MovieViewModel) {
        
        self.movieTitle.text = viewModel.movieTitle
        self.movieReleaseDate.text = viewModel.movieReleaseDate
        self.movieDescription.text = viewModel.movieDescription
        self.movieRating.text = viewModel.movieRating
        self.movieImageView.downloadImageFromUrl(viewModel.moviewImageURL)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
