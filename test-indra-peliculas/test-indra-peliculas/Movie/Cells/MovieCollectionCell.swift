//
//  MovieCollectionCell.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//

import UIKit
import Kingfisher

class MovieCollectionCell: UICollectionViewCell {
    static var identifier = "MovieCollectionCell"
    
    @IBOutlet weak var movieImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(movie: MovieData) {
        self.movieImage.image = UIImage(named: "PosterPlaceholder")
        if let posterPath = movie.posterPath {
            if let url = URL(string: posterPath) {
                self.movieImage.kf.setImage(with: url ,
                                            placeholder: UIImage(named: "PosterPlaceholder"))
            }
        }
    }
}
