//
//  ListsMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/27/22.
//

@testable import TMDBSwift
import XCTest

final class ListsMDBTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testLists() {
        var data: ListsMDB?
        let expectation = self.expectation(description: "Wait for data to load.")

        ListsMDB.lists(listId: "1") { _, lists in
            data = lists
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

}
