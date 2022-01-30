//
//  SearchProtocols.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import Foundation
import UIKit

protocol SearchViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: SearchPresenterProtocol? { get set }
}

protocol SearchWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createSearchModule() -> UIViewController
}

protocol SearchPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: SearchViewProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var wireFrame: SearchWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol SearchInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol SearchInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: SearchInteractorOutputProtocol? { get set }
    var localDatamanager: SearchLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SearchRemoteDataManagerInputProtocol? { get set }
}

protocol SearchDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol SearchRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SearchRemoteDataManagerOutputProtocol? { get set }
}

protocol SearchRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol SearchLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
