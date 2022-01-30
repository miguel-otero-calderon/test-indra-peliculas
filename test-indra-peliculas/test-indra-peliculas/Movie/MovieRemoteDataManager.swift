//
//  MovieRemoteDataManager.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//  
//

import Foundation

class MovieRemoteDataManager:MovieRemoteDataManagerInputProtocol {
    var remoteRequestHandler: MovieRemoteDataManagerOutputProtocol?
    let urlImage = "https://image.tmdb.org/t/p/w500"
    func getMovies(request: MovieRequest, completion: @escaping (Result<[MovieData], Error>) -> Void) {
        let service = MovieService()
        service.getMovies(request: request) { response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let response = response {
                var movies:[MovieData] = []
                
                for item in response.results {
                    var movie = item
                    if let backdropPath = item.backdropPath {
                        movie.backdropPath = self.urlImage + backdropPath
                    }
                    if let posterPath = item.posterPath {
                        movie.posterPath = self.urlImage + posterPath
                    }
                    movies.append(movie)
                }
                
                completion(.success(movies))
            }
        }
    }
}
