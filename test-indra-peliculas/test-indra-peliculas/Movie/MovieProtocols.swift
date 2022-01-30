//
//  MovieProtocols.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//  
//

import Foundation
import UIKit

protocol MovieViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MoviePresenterProtocol? { get set }
}

protocol MovieWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createMovieModule() -> UIViewController
}

protocol MoviePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MovieViewProtocol? { get set }
    var interactor: MovieInteractorInputProtocol? { get set }
    var wireFrame: MovieWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol MovieInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol MovieInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MovieInteractorOutputProtocol? { get set }
    var localDatamanager: MovieLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MovieRemoteDataManagerInputProtocol? { get set }
}

protocol MovieDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol MovieRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MovieRemoteDataManagerOutputProtocol? { get set }
}

protocol MovieRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol MovieLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
