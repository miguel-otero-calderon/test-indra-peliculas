//
//  MovieInteractor.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//  
//

import Foundation

class MovieInteractor: MovieInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: MovieInteractorOutputProtocol?
    var localDatamanager: MovieLocalDataManagerInputProtocol?
    var remoteDatamanager: MovieRemoteDataManagerInputProtocol?

    func getMovies(request: MovieRequest, completion: @escaping (Result<[MovieData], Error>) -> Void) {
        remoteDatamanager?.getMovies(request: request, completion: completion)
    }
}

extension MovieInteractor: MovieRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
