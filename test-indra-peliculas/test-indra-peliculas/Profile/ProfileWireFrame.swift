//
//  ProfileWireFrame.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import Foundation
import UIKit

class ProfileWireFrame: ProfileWireFrameProtocol {

    class func createProfileModule() -> UIViewController {
        let profileView = mainStoryboard.instantiateViewController(withIdentifier: "ProfileView") as? ProfileView
        if let view = profileView {
            let presenter: ProfilePresenterProtocol & ProfileInteractorOutputProtocol = ProfilePresenter()
            let interactor: ProfileInteractorInputProtocol & ProfileRemoteDataManagerOutputProtocol = ProfileInteractor()
            let localDataManager: ProfileLocalDataManagerInputProtocol = ProfileLocalDataManager()
            let remoteDataManager: ProfileRemoteDataManagerInputProtocol = ProfileRemoteDataManager()
            let wireFrame: ProfileWireFrameProtocol = ProfileWireFrame()
            
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
        return UIStoryboard(name: "ProfileView", bundle: Bundle.main)
    }
    
}
