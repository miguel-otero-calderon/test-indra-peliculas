//
//  ProfilePresenter.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import Foundation

class ProfilePresenter  {
    
    // MARK: Properties
    weak var view: ProfileViewProtocol?
    var interactor: ProfileInteractorInputProtocol?
    var wireFrame: ProfileWireFrameProtocol?
    
}

extension ProfilePresenter: ProfilePresenterProtocol {
    func loginOut() {
        interactor?.loginOut()
    }
    
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension ProfilePresenter: ProfileInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
