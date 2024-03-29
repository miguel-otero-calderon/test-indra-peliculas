//
//  MovieRequest.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation

struct MovieRequest {
    let movieType: MovieType
    let page: Int
}

enum MovieType {
    case popular
    case topRated
    case upComing
}
