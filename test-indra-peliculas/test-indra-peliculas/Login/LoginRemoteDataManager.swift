//
//  LoginRemoteDataManager.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation

class LoginRemoteDataManager:LoginRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: LoginRemoteDataManagerOutputProtocol?
    
    func signIn(email: String, password: String, completion: @escaping (Result<LoginEntity, Error>) -> Void) {
        if email.uppercased() == "ADMIN" && password == "Password*123" {
            let user = LoginEntity(username: "Administrador", email: "Admin")
            UserDefaults.standard.setValue(user.username, forKey: "username")
            UserDefaults.standard.setValue(user.email, forKey: "email")
            completion(.success(user))
        } else {
            completion(.failure(LoginError.signInFailed))
        }
    }
}
