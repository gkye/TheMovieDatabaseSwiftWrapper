//
//  TVSeasonsMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/27/22.
//

import XCTest
@testable import TMDBSwift

final class TVSeasonsMDBTests: XCTestCase {

    let expecationTimeout: TimeInterval = 50

    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testCredits() {
        var data: TVCreditsMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        TVSeasonsMDB.credits(tvShowId: 1399, seasonNumber: 1, language: nil) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testExternalIDS() {
        var data: ExternalIdsMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        TVSeasonsMDB.externalIDS(tvShowId: 1399, seasonNumber: 1, language: nil) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testImages() {
        var data: ImagesMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        TVSeasonsMDB.images(tvShowId: 1399, seasonNumber: 1, language: nil) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data.posters)
    }

    func testSeasonNumber() {
        var data: TVSeasonsMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        TVSeasonsMDB.season_number(tvShowId: 1399, seasonNumber: 1, language: nil) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testVideos() {
        var data: [VideosMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        TVSeasonsMDB.videos(tvShowId: 1399, seasonNumber: 1, language: nil) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }
}
