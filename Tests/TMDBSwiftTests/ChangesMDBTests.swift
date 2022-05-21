//
//  PersonMDBTests.swift
//  TMDBSwift-iOS
//
//  Created by Martin Pfundmair on 2018-10-13.
//  Copyright © 2018 George. All rights reserved.
//

import XCTest
@testable import TMDBSwift

final class ChangesMDBTests: XCTestCase {

    let expecationTimeout: TimeInterval = 50

    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    override func tearDown() {
        super.tearDown()
    }

    func testChanges() {
        var data: [ChangesMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        ChangesMDB.changes(type: .movie) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertGreaterThan(data.count, 0)
    }

    func testChangesWithEnum() {
        var data: [ChangesMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        ChangesMDB.changes(type: .movie) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertGreaterThan(data.count, 0)
    }

    func testChangesWithParam() {
        var data: [ChangesMDB]!
        var api: ClientReturn!
        let expectation = self.expectation(description: "Wait for data to load.")

        ChangesMDB.changes(type: .tv, page: 1) { responseApi, responseData in
            api = responseApi
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data[0].id)
        XCTAssertNotNil(data[0].adult)
        XCTAssertEqual(api.pageResults?.page, 1)
    }
}
