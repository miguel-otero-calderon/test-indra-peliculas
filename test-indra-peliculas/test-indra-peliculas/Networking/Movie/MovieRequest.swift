//
//  MovieRequest.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation

struct MovieRequest {
    let movieType: MovieType
}

enum MovieType {
    case popular
    case topRated
    case upComing
}
