//
//  SearchView.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import Foundation
import UIKit

class SearchView: UIViewController {

    // MARK: Properties
    var presenter: SearchPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchView: SearchViewProtocol {
    // TODO: implement view output methods
}
