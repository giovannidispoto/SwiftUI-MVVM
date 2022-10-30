//
//  MovieViewModelTests.swift
//  MyMovieRatingTests
//
//  Created by Giovanni Dispoto on 30/10/22.
//

import XCTest
@testable import MyMovieRating

final class MovieViewModelTests: XCTestCase {
    private var viewModel: MovieViewModel!

    override func setUp() {
        super.setUp()
        viewModel = MovieViewModel.notEmpty()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        XCTAssert(viewModel.movies.count == 3, "Initial number of movies")
        
    }

   // func testPerformanceExample() throws {
        // This is an example of a performance test case.
   //     self.measure {
            // Put the code you want to measure the time of here.
   //     }
   // }

}

