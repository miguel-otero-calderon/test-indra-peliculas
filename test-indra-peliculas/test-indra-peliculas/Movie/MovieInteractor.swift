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

}

extension MovieInteractor: MovieRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
