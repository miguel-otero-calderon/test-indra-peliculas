//
//  SearchWireFrame.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import Foundation
import UIKit

class SearchWireFrame: SearchWireFrameProtocol {

    class func createSearchModule() -> UIViewController {
        let searchView = mainStoryboard.instantiateViewController(withIdentifier: "SearchView") as? SearchView
        if let view = searchView {
            let presenter: SearchPresenterProtocol & SearchInteractorOutputProtocol = SearchPresenter()
            let interactor: SearchInteractorInputProtocol & SearchRemoteDataManagerOutputProtocol = SearchInteractor()
            let localDataManager: SearchLocalDataManagerInputProtocol = SearchLocalDataManager()
            let remoteDataManager: SearchRemoteDataManagerInputProtocol = SearchRemoteDataManager()
            let wireFrame: SearchWireFrameProtocol = SearchWireFrame()
            
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
        return UIStoryboard(name: "SearchView", bundle: Bundle.main)
    }
    
}
