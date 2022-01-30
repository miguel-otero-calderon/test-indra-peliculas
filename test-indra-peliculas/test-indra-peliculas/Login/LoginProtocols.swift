//
//  LoginProtocols.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation
import UIKit

protocol LoginViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: LoginPresenterProtocol? { get set }
}

protocol LoginWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createLoginModule() -> UIViewController
}

protocol LoginPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorInputProtocol? { get set }
    var wireFrame: LoginWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func getTermsOfService() -> String
    func getPrivacyPolicy() -> String
    func signIn(email: String,password: String,completion: @escaping (Result<LoginEntity, Error>) -> Void)
    func existsLogin() -> Bool
}

protocol LoginInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol LoginInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: LoginInteractorOutputProtocol? { get set }
    var localDatamanager: LoginLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: LoginRemoteDataManagerInputProtocol? { get set }
    
    func signIn(email: String,password: String,completion: @escaping (Result<LoginEntity, Error>) -> Void)
    func existsLogin() -> Bool
}

protocol LoginDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol LoginRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: LoginRemoteDataManagerOutputProtocol? { get set }
    
    func signIn(email: String,password: String,completion: @escaping (Result<LoginEntity, Error>) -> Void)
}

protocol LoginRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol LoginLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    func existsLogin() -> Bool
}
