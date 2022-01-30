//
//  MovieWireFrame.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//  
//

import Foundation
import UIKit

class MovieWireFrame: MovieWireFrameProtocol {

    class func createMovieModule() -> UIViewController {
        let movieView = mainStoryboard.instantiateViewController(withIdentifier: "MovieView") as? MovieView
        if let view = movieView {
            let presenter: MoviePresenterProtocol & MovieInteractorOutputProtocol = MoviePresenter()
            let interactor: MovieInteractorInputProtocol & MovieRemoteDataManagerOutputProtocol = MovieInteractor()
            let localDataManager: MovieLocalDataManagerInputProtocol = MovieLocalDataManager()
            let remoteDataManager: MovieRemoteDataManagerInputProtocol = MovieRemoteDataManager()
            let wireFrame: MovieWireFrameProtocol = MovieWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return view
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "MovieView", bundle: Bundle.main)
    }
    
}
