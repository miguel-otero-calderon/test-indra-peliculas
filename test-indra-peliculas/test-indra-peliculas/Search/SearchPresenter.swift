//
//  SearchPresenter.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import Foundation

class SearchPresenter  {
    
    // MARK: Properties
    weak var view: SearchViewProtocol?
    var interactor: SearchInteractorInputProtocol?
    var wireFrame: SearchWireFrameProtocol?
    
}

extension SearchPresenter: SearchPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    func getSearch(request: SearchRequest, completion: @escaping (Result<[MovieData], Error>) -> Void) {
        interactor?.getSearch(request: request, completion: completion)
    }
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
