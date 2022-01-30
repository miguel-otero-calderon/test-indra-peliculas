//
//  ProfileInteractor.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import Foundation

class ProfileInteractor: ProfileInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ProfileInteractorOutputProtocol?
    var localDatamanager: ProfileLocalDataManagerInputProtocol?
    var remoteDatamanager: ProfileRemoteDataManagerInputProtocol?

}

extension ProfileInteractor: ProfileRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
