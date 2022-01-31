//
//  MovieDetailProtocols.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import Foundation
import UIKit

protocol MovieDetailViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MovieDetailPresenterProtocol? { get set }
}

protocol MovieDetailWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createMovieDetailModule() -> UIViewController
}

protocol MovieDetailPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MovieDetailViewProtocol? { get set }
    var interactor: MovieDetailInteractorInputProtocol? { get set }
    var wireFrame: MovieDetailWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol MovieDetailInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol MovieDetailInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MovieDetailInteractorOutputProtocol? { get set }
    var localDatamanager: MovieDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MovieDetailRemoteDataManagerInputProtocol? { get set }
}

protocol MovieDetailDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol MovieDetailRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MovieDetailRemoteDataManagerOutputProtocol? { get set }
}

protocol MovieDetailRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol MovieDetailLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
