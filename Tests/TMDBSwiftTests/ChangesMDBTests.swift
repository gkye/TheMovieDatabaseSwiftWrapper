//
//  PersonMDBTests.swift
//  TMDBSwift-iOS
//
//  Created by Martin Pfundmair on 2018-10-13.
//  Copyright © 2018 George. All rights reserved.
//

@testable import TMDBSwift
import XCTest

final class ChangesMDBTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testChanges() {
        var data: [ChangesMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        ChangesMDB.changes(type: .movie, page: 1, startDate: "2019-05-10", endDate: "2019-05-20") { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertGreaterThan(data.count, 0)
    }

    func testChangesWithEnum() {
        var data: [ChangesMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        ChangesMDB.changes(type: .movie) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertGreaterThan(data.count, 0)
    }

    func testChangesWithParam() {
        var data: [ChangesMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        ChangesMDB.changes(type: .tv, page: 1) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNotNil(data[0].id)
        XCTAssertNotNil(data[0].adult)
    }
}
