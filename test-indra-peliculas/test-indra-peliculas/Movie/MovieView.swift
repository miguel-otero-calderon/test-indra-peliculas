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
    var page: Int = 0
    var totalPages: Int = 0

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Upcoming movies"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: MovieCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieCollectionCell.identifier)
        collectionView.register(UINib(nibName: PaginationCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: PaginationCollectionCell.identifier)
        
        self.page = 1
        let request = MovieRequest(movieType: .upComing, page: self.page)
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
        
        if self.movies.count == 0 {
            return 0
        } else {
            return self.movies.count + 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellMovie = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionCell.identifier, for: indexPath) as? MovieCollectionCell
        if indexPath.row <= 19 {
            let movie = self.movies[indexPath.row]
            cellMovie?.configure(movie: movie)
            return cellMovie!
        } else {
            let cellPagination = collectionView.dequeueReusableCell(withReuseIdentifier: PaginationCollectionCell.identifier, for: indexPath) as? PaginationCollectionCell
            cellPagination?.delegate = self
            cellPagination?.configure(page: self.page)
            return cellPagination!
        }
    }
}

extension MovieView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row <= 19 {
            let width = UIScreen.main.bounds.width/2 - 10
            let height = UIScreen.main.bounds.height/3
            return CGSize(width: width, height: height)
        }
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: 50)
    }
}

extension MovieView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        if indexPath.row <= 19 {
            let movie = self.movies[indexPath.row]
            let movieDetailView = (MovieDetailWireFrame.createMovieDetailModule() as? MovieDetailView)!
            movieDetailView.movie = movie
            movieDetailView.modalPresentationStyle = .fullScreen
            self.present(movieDetailView, animated: true, completion: nil)
        }
        if indexPath.row == 20 {
            
        }
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
extension MovieView :PaginationCollectionCellDelegate {
    func getPage(page: Int) {
        self.page = page
        let request = MovieRequest(movieType: .upComing, page: self.page)
        self.loadMovies(request:request)
    }
}
