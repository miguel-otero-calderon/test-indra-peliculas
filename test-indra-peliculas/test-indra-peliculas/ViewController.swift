//
//  ViewController.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let service = MovieService()
        service.getMovies(request: MovieRequest(movieType: .upComing, page: 1)) { response, error in
            if let response = response {
                if response.results.count == 0 {
                    print(true)
                }
                print(response)
            }
            print(error)
        }
        
    }
}

