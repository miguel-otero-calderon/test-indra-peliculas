//
//  MovieEndpoint.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation
import Alamofire

enum MovieEndPoint: EndPoint {
    
    case getMoviesPopular(page:Int)
    case getMoviesTopReated(page:Int)
    case getMoviesUpComing(page:Int)
    
    var apiKey: String {
        return "&api_key=5bacc14904bd68ba223796bc499eec47"
    }

    var baseURL: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .getMoviesPopular:
            return "/3/movie/popular"
        case .getMoviesTopReated:
            return "/3/movie/top_rated"
        case .getMoviesUpComing:
            return "/3/movie/upcoming"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMoviesPopular, .getMoviesTopReated, .getMoviesUpComing:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getMoviesPopular, .getMoviesTopReated, .getMoviesUpComing:
            return URLEncoding.default
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getMoviesPopular, .getMoviesTopReated, .getMoviesUpComing:
            return nil
        }
    }
    
    private var pagination: String {
        switch self {
        case .getMoviesPopular(page: let page):
            return "?page=\(page)"
        case .getMoviesTopReated(page: let page):
            return "?page=\(page)"
        case .getMoviesUpComing(page: let page):
            return "?page=\(page)"
        }
    }
    
    func toURL() -> URLConvertible {
        return baseURL + path + pagination + apiKey
    }
    
}
