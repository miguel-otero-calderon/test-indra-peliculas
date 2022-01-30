//
//  MovieView.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//  
//

import Foundation
import UIKit

class MovieView: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: Properties
    var presenter: MoviePresenterProtocol?
    var movies:[MovieData] = []

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Upcoming movies"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: MovieCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieCollectionCell.identifier)
        
        let request = MovieRequest(movieType: .upComing, page: 1)
        self.loadMovies(request:request)
    }
}

extension MovieView: MovieViewProtocol {
    // TODO: implement view output methods
}
extension MovieView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath) as? MovieCollectionCell
        
        let movie = self.movies[indexPath.row]

        cell?.configure(movie: movie)
        
        return cell!
    }
}

extension MovieView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width/2 - 10
        let height = UIScreen.main.bounds.height/3
        return CGSize(width: width, height: height)
    }
}

extension MovieView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie = self.movies[indexPath.row]

//        self.delegate?.isSelected(movie: movie)
    }
}
extension MovieView {
    func loadMovies(request: MovieRequest) {
        presenter?.getMovies(request: request, completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self.movies = movies
                case .failure(let error):
                    self.movies = []
                    print(error)
                }
                self.collectionView.reloadData()
            }
        })
    }
}
