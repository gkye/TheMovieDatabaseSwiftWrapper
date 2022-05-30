//
//  KeywordsMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/30/22.
//

@testable import TMDBSwift
import XCTest

final class KeywordsMDBTests: XCTestCase {
    let expecationTimeout: TimeInterval = 50

    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testKeyword() {
        var data: KeywordsMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        KeywordsMDB.keyword(keywordId: 999) { _, keyword in
            data = keyword
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testKeywordMovies() {
        var data: [MovieMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        KeywordsMDB.keyword_movies(keywordId: 999, page: 1, language: nil) { _, movie in
            data = movie
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }
}
