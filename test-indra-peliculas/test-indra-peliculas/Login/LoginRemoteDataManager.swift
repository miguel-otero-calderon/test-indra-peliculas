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
        let userHard = "ADMIN"
        let passwordHard = "Password*123"
        
        if email.uppercased() == userHard && password == password {
            let loginEntity = LoginEntity(username: "Administrador", email: "Admin", password: password)
            UserDefaults.standard.setValue(loginEntity.username, forKey: "username")
            UserDefaults.standard.setValue(loginEntity.email, forKey: "email")
            completion(.success(loginEntity))
        } else {
            if email.uppercased() != userHard {
                completion(.failure(LoginError.userNotExist))
            } else if password != passwordHard {
                completion(.failure(LoginError.passwordIncorrect))
            }
        }
    }
}
