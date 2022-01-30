//
//  ProfileLocalDataManager.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import Foundation

class ProfileLocalDataManager:ProfileLocalDataManagerInputProtocol {
    func loginOut() {
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "username")
        print("LoginOut")
    }
}
