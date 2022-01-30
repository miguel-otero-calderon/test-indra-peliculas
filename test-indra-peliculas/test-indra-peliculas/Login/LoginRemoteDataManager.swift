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
        
    }
}
