//
//  LoginInteractor.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation

class LoginInteractor: LoginInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: LoginInteractorOutputProtocol?
    var localDatamanager: LoginLocalDataManagerInputProtocol?
    var remoteDatamanager: LoginRemoteDataManagerInputProtocol?

    func signIn(email: String, password: String, completion: @escaping (Result<LoginEntity, Error>) -> Void) {
        remoteDatamanager?.signIn(email: email, password: password, completion: completion)
    }
}

extension LoginInteractor: LoginRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
