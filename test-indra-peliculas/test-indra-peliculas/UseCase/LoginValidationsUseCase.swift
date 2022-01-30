//
//  LoginValidationsUseCase.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation

struct LoginValidationsUseCase {
    
    let loginEntity: LoginEntity
    
    public init(loginEntity: LoginEntity) {
        self.loginEntity = loginEntity
    }
    
    func getValidatedPassword() -> String {
        if self.loginEntity.password == "" {
            return "Password empty"
        }
        if self.loginEntity.password.count <= 6 {
            return "Enter password greater than 6 characters"
        }
        return ""
    }
    
    func getValidatedUser() -> String {
        if self.loginEntity.email == "" {
            return "User empty"
        }
        if self.loginEntity.email.count <= 4 {
            return "Enter password greater than 4 characters"
        }
        return ""
    }
}
