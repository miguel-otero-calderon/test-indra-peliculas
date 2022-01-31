//
//  SearchServiceTest.swift
//  test-indra-peliculasTests
//
//  Created by Miguel on 30/01/22.
//


import XCTest
@testable import test_indra_peliculas

class SearchServiceTest: XCTestCase {
    
    var service: SearchServiceProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        service = SearchService()
    }
    
    override func tearDownWithError() throws {
        service = nil
        try super.tearDownWithError()
    }
    
    func testMoviService_upComing_Page1() throws {
        service.getSearch(request: SearchRequest(query: "cat", page: 1)) { response, error in
            if let response = response {
                XCTAssertTrue(response.results.count > 0)
            }
        }
    }
}
