//
//  MovieService.swift
//  test-indra-peliculas
//
//  Created by Miguel on 29/01/22.
//

import Foundation
import Alamofire

protocol MovieServiceProtocol{
    func getMovies(request: MovieRequest, completion: @escaping (MovieResponse?, Error?) -> Void)
}

class MovieService: MovieServiceProtocol {
    
    func getMovies(request: MovieRequest, completion: @escaping (MovieResponse?, Error?) -> Void) {
        let endPoint: MovieEndPoint
        
        switch request.movieType {
        case .popular:
            endPoint = .getMoviesPopular(page: request.page)
        case .topRated:
            endPoint = .getMoviesTopReated(page: request.page)
        case .upComing:
            endPoint = .getMoviesUpComing(page: request.page)
        }
        
        print(endPoint.toURL())
        
        AF.request( endPoint.toURL(),
                    method: endPoint.method)
            .response {[weak self] response in
                
            switch response.result {
            case .success(let data):
                guard let data = data else {
                    return
                }
                do {
                    let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                    completion(response, nil)
                } catch {
                    completion(nil,error)
                }
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
}

