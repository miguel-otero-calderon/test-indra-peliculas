//
//  SearchService.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//

import Foundation
import Alamofire

protocol SearchServiceProtocol{
    func getSearch(request: SearchRequest, completion: @escaping (MovieResponse?, Error?) -> Void)
}

class SearchService: SearchServiceProtocol {
    
    func getSearch(request: SearchRequest, completion: @escaping (MovieResponse?, Error?) -> Void) {
        let endPoint: SearchEndPoint
        endPoint = .getSearch(query: request.query, page: request.page)
        
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


