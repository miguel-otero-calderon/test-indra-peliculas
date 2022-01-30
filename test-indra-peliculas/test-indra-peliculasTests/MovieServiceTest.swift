//
//  MovieServiceTest.swift
//  test-indra-peliculasTests
//
//  Created by Miguel on 29/01/22.
//

import XCTest
@testable import test_indra_peliculas

class MovieServiceTest: XCTestCase {

    var service: MovieServiceProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        service = MovieService()
    }

    override func tearDownWithError() throws {
        service = nil
        try super.tearDownWithError()
    }

    func testMoviService_upComing_Page4() throws {
        service.getMovies(request: MovieRequest(movieType: .upComing, page: 4)) { response, error in
            if let response = response {
                XCTAssertTrue(response.results.count > 0)
            }
        }
    }
}
