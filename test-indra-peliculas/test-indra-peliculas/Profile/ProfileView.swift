//
//  ProfileView.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import Foundation
import UIKit

class ProfileView: UIViewController {

    // MARK: Properties
    var presenter: ProfilePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProfileView: ProfileViewProtocol {
    // TODO: implement view output methods
}
