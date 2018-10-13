//
//  PersonMDBTests.swift
//  TMDBSwift-iOS
//
//  Created by Martin Pfundmair on 2018-10-13.
//  Copyright © 2018 George. All rights reserved.
//

import XCTest
@testable import TMDBSwift

class ChangesMDBTests: XCTestCase {

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

    ChangesMDB.changes(changeType: "movie") { api, responseData in
      data = responseData
      expectation.fulfill()
    }
    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertNotNil(data.first?.id)
    XCTAssertNotNil(data.first?.adult)
  }

  func testChangesNew() {
    var data: [ChangesMDB]!
    let expectation = self.expectation(description: "Wait for data to load.")

    ChangesMDB.changes(changeType: .movie) { api, responseData in
      data = responseData
      expectation.fulfill()
    }
    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertNotNil(data.first?.id)
    XCTAssertNotNil(data.first?.adult)
  }

}
