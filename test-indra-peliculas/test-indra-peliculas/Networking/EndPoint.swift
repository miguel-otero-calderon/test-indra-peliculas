//
//  EndPoint.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation
import Alamofire

protocol EndPoint {
    var apiKey: String { get }
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
}
extension EndPoint {
    func toURL() -> URLConvertible {
        return baseURL + path + apiKey
    }
}
