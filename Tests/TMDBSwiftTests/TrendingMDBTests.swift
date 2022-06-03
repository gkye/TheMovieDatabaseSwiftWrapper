//
//  TrendingMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/27/22.
//

@testable import TMDBSwift
import XCTest

final class TrendingMDBTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testTVTrendingDay() {
        var data: [TVMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        TrendingMDB.trending(mediaType: .tv, timeWindow: .day) { _, _, tvData in
            data = tvData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testTVTrendingWeek() {
        var data: [TVMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        TrendingMDB.trending(mediaType: .tv, timeWindow: .week) { _, _, tvData in
            data = tvData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testMovieTrendingDay() {
        var data: [MovieMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        TrendingMDB.trending(mediaType: .movie, timeWindow: .day) { _, movieData, _ in
            data = movieData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testMovieTrendingWeek() {
        var data: [MovieMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        TrendingMDB.trending(mediaType: .movie, timeWindow: .week) { _, movieData, _ in
            data = movieData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }
}
