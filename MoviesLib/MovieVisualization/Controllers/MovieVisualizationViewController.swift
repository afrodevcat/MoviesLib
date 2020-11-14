//
//  MovieVisualizationViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 11/11/20.
//  Copyright © 2020 Afrodev. All rights reserved.
//

//Controle de Acesso

//final

//open
//public
//internal
//fileprivate
//private

import UIKit

final class MovieVisualizationViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCategories: UILabel!
    @IBOutlet weak var labelDuration: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var textViewSummary: UITextView!
    
    // MARK: - Properties
    var movie: Movie?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            labelTitle.text = movie.title
            labelCategories.text = movie.categories
            labelRating.text = movie.ratingFormatted
            labelDuration.text = movie.duration
            textViewSummary.text = movie.summary
            imageViewPoster.image = UIImage(named: movie.image)
        }
        
    }

    // MARK: - IBActions
    @IBAction private func playTrailer(_ sender: UIButton) {
    }
}
