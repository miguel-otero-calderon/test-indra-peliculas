//
//  SearchEndPoint.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//

import Foundation
import Alamofire

enum SearchEndPoint: EndPoint {
    
    case getSearch(query:String,page:Int)
    
    var apiKey: String {
        return "?api_key=5bacc14904bd68ba223796bc499eec47"
    }
    
    var baseURL: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .getSearch:
            return "/3/search/movie"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getSearch :
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getSearch :
            return URLEncoding.default
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getSearch :
            return nil
        }
    }
    
    private var pagination: String {
        switch self {
        case .getSearch(query: let query, page: let page):
            return "&page=\(page)"
        }
    }
    
    private var query: String {
        switch self {
        case .getSearch(query: let query, page: let page):
            return "&query=\(query)"
        }
    }

    private var other: String {
        switch self {
        case .getSearch:
            return "&language=en&include_adult=false"
        }
    }
    
    func toURL() -> URLConvertible {
        return baseURL + path + apiKey + pagination + query + other
    }
    
}

