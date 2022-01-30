//
//  LoginEntity.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation

struct LoginEntity: Codable {
    let username: String
    let email: String
    let password: String
}
enum LoginError: Error {
    case userNotExist
    case passwordIncorrect
    
}
