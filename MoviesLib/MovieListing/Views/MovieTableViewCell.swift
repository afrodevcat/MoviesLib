//
//  MovieTableViewCell.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 14/11/20.
//  Copyright © 2020 Afrodev. All rights reserved.
//

import UIKit

final class MovieTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var imageViewPoster: UIImageView!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelSummary: UILabel!
    @IBOutlet private weak var labelRating: UILabel!
    
    // MARK: - Methods
    func configure(with movie: Movie) {
        labelTitle.text = movie.title
        labelSummary.text = movie.summary
        labelRating.text = movie.ratingFormatted
        imageViewPoster.image = UIImage(named: movie.smallImage)
    }
}
