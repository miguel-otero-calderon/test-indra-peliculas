//
//  SearchInteractor.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: SearchInteractorOutputProtocol?
    var localDatamanager: SearchLocalDataManagerInputProtocol?
    var remoteDatamanager: SearchRemoteDataManagerInputProtocol?

    func getSearch(request: SearchRequest, completion: @escaping (Result<[MovieData], Error>) -> Void) {
        remoteDatamanager?.getSearch(request: request, completion: completion)
    }
}

extension SearchInteractor: SearchRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
