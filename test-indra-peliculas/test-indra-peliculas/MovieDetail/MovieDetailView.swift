//
//  MovieDetailView.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import Foundation
import UIKit
import Kingfisher

class MovieDetailView: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var votoAverageView: VoteAverageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie:MovieData?
    // MARK: Properties
    var presenter: MovieDetailPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let movie = movie else {
            return
        }
        
        self.titleLabel.text = movie.title
        self.votoAverageView.voteValue = movie.voteAverage
        self.releaseDateLabel.text = "Release date: \(movie.releaseDate)"
        self.overviewLabel.text = "Overview: \r2\(movie.overview)"
                
        if let backdropPath = movie.backdropPath {
            if let url = URL(string: backdropPath) {
                self.movieImage.kf.setImage(with: url ,
                                            placeholder: UIImage(named: "PosterPlaceholder"))
            }
        }
        if self.movieImage.image == nil {
            self.movieImage.image = UIImage(named: "PosterPlaceholder")
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MovieDetailView: MovieDetailViewProtocol {
    // TODO: implement view output methods
}
