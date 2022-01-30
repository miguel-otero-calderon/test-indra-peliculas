//
//  LoginLocalDataManager.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation

class LoginLocalDataManager:LoginLocalDataManagerInputProtocol {
    func existsLogin() -> Bool {
        guard let _ = UserDefaults.standard.string(forKey: "email") else {
            return false
        }
        return true
    }
}
