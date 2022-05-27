//
//  ReviewsMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/27/22.
//

@testable import TMDBSwift
import XCTest

final class ReviewsMDBTests: XCTestCase {

    let expecationTimeout: TimeInterval = 50

    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    override func tearDown() {
        super.tearDown()
    }

    func testReview() {
        var data: ReviewsMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        ReviewsMDB.review(reviewId: "627599e61b1f3c0051e4d96d") { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

}
