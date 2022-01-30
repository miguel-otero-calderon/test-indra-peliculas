//
//  MoviePresenter.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//  
//

import Foundation

class MoviePresenter  {
    
    // MARK: Properties
    weak var view: MovieViewProtocol?
    var interactor: MovieInteractorInputProtocol?
    var wireFrame: MovieWireFrameProtocol?
    
}

extension MoviePresenter: MoviePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    func getMovies(request: MovieRequest, completion: @escaping (Result<[MovieData], Error>) -> Void) {
        interactor?.getMovies(request: request, completion: completion)
    }
}

extension MoviePresenter: MovieInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
