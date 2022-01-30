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
}
enum LoginError: Error {
    case signInFailed
}
