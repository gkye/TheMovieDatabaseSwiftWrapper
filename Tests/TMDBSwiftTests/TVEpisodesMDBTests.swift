//
//  TVEpisodesMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/27/22.
//

@testable import TMDBSwift
import XCTest

final class TVEpisodesMDBTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testCredits() {
        var data: TVCreditsMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        TVEpisodesMDB.credits(tvShowId: 1399, seasonNumber: 1, episodeNumber: 1) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testExternalIDS() {
        var data: ExternalIdsMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        TVEpisodesMDB.externalIDS(tvShowId: 1399, seasonNumber: 1, episodeNumber: 1, language: nil) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testImages() {
        var data: ImagesMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        TVEpisodesMDB.images(tvShowId: 1399, seasonNumber: 1, episodeNumber: 1) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data.stills)
    }

    func testEpisodeNumber() {
        var data: TVEpisodesMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        TVEpisodesMDB.episode_number(tvShowId: 1399, seasonNumber: 1, episodeNumber: 1, language: nil) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testVideos() {
        var data: [VideosMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        TVEpisodesMDB.videos(tvShowId: 1399, seasonNumber: 1, episodeNumber: 1, language: nil) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }
}
