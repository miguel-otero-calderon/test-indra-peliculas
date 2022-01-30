//
//  LoginWireFrame.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation
import UIKit

class LoginWireFrame: LoginWireFrameProtocol {

    class func createLoginModule() -> UIViewController {
        let loginView = mainStoryboard.instantiateViewController(withIdentifier: "LoginView") as? LoginView
        if let view = loginView {
            let presenter: LoginPresenterProtocol & LoginInteractorOutputProtocol = LoginPresenter()
            let interactor: LoginInteractorInputProtocol & LoginRemoteDataManagerOutputProtocol = LoginInteractor()
            let localDataManager: LoginLocalDataManagerInputProtocol = LoginLocalDataManager()
            let remoteDataManager: LoginRemoteDataManagerInputProtocol = LoginRemoteDataManager()
            let wireFrame: LoginWireFrameProtocol = LoginWireFrame()
            
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
        return UIStoryboard(name: "LoginView", bundle: Bundle.main)
    }
    
}
