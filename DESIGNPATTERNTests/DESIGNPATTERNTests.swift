//
//  DESIGNPATTERNTests.swift
//  DESIGNPATTERNTests
//
//  Created by Rohit Chauhan on 03/09/22.
//

import XCTest
@testable import DESIGNPATTERN

class DESIGNPATTERNTests: XCTestCase {
    var sut: MoviewListVc_MVC? = MoviewListVc_MVC()
    
    override func setUpWithError() throws {
        sut = MoviewListVc_MVC()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
       sut = nil
       try tearDownWithError()
    }

    func testMovieApi() {
        let url = "http://localhost:8080/api/movies"
        let promise = expectation(description: "Get Movies")
        var success: Bool = false
        
        sut?.getMovies(with: url, completion: { response in
            switch response {
               case .success(_):
                   success = true
                
               case .failure(let error):
                   print("Error = \(error)")
            }
            
        })
        
        wait(for: [promise], timeout: 5)
        
        XCTAssertTrue(success)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
