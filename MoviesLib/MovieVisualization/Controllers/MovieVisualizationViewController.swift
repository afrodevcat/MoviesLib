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
import AVKit

final class MovieVisualizationViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCategories: UILabel!
    @IBOutlet weak var labelDuration: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var textViewSummary: UITextView!
    @IBOutlet weak var viewMovie: UIView!
    @IBOutlet weak var buttonPlay: UIButton!
    
    // MARK: - Properties
    var movie: Movie?
    var trailer: String = ""
    var moviePlayer: AVPlayer!
    var moviePlayerController: AVPlayerViewController!
    
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
            loadTrailer(for: movie.title)
        }
        
    }
    
    // MARK: - Methods
    private func loadTrailer(for title: String) {
        let itunesPath = "https://itunes.apple.com/search?media=movie&entity=movie&term="
        guard let encodedTitle = title.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              !encodedTitle.isEmpty,
              let url = URL(string: "\(itunesPath)\(encodedTitle)")
                else {
                    print("Erro!!")
                    return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let itunesResult = try! JSONDecoder().decode(ItunesResult.self, from: data!)
            self.trailer = itunesResult.results?.first?.previewUrl ?? ""
        }.resume()
    }

    // MARK: - IBActions
    @IBAction private func playTrailer(_ sender: UIButton) {
        guard let url = URL(string: trailer) else {return}
        moviePlayer = AVPlayer(url: url)
        moviePlayerController = AVPlayerViewController()
        moviePlayerController.showsPlaybackControls = true
        moviePlayerController.player = moviePlayer
        
        /*
        guard let movieView = moviePlayerController.view else {return}
        movieView.frame = viewMovie.bounds
        viewMovie.addSubview(movieView)
        
        moviePlayer.play()
        self.buttonPlay.isHidden = true
        */
        
        
        present(moviePlayerController, animated: true) {
            self.moviePlayer.play()
        }
        
    }
}

struct ItunesResult: Decodable {
    let results: [ItunesMovie]?
}

struct ItunesMovie: Decodable {
    let previewUrl: String?
}
