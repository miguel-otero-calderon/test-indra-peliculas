//
//  LoginPresenter.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation

class LoginPresenter  {
    
    // MARK: Properties
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var wireFrame: LoginWireFrameProtocol?
    
}

extension LoginPresenter: LoginPresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func getTermsOfService() -> String {
        return "https://www.instagram.com/"
    }
    
    func getPrivacyPolicy() -> String {
        return "https://www.instagram.com/"
    }

    func signIn(email: String, password: String, completion: @escaping (Result<LoginEntity, Error>) -> Void) {
        interactor?.signIn(email: email, password: password, completion: completion)
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
