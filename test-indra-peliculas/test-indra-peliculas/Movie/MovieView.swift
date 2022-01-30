//
//  MovieView.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//  
//

import Foundation
import UIKit

class MovieView: UIViewController {

    // MARK: Properties
    var presenter: MoviePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MovieView: MovieViewProtocol {
    // TODO: implement view output methods
}
