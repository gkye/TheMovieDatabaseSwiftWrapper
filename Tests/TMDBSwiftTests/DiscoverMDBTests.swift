//
//  DiscoverMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/30/22.
//

@testable import TMDBSwift
import XCTest

final class DiscoverMDBTests: XCTestCase {
    let expecationTimeout: TimeInterval = 50

    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testDiscoverTV() {
        var tv:  [TVMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        DiscoverMDB.discover(discoverType: .tv, params: []) { _, _, tvData in
            tv = tvData
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(tv)
    }

    func testDiscoverMovie() {
        var movie:  [MovieMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        DiscoverMDB.discover(discoverType: .movie, params: []) { _, movieData, _ in
            movie = movieData
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(movie)
    }

}
