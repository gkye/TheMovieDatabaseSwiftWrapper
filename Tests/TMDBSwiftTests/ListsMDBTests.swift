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
        // Put setup code here. This method is called before the invocation of each test method in the class.
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testLists() {
        var data: ListsMDB?
        let expectation = self.expectation(description: "Wait for data to load.")

        ListsMDB.lists(listId: "1") { _, lists in
            data = lists
            expectation.fulfill()
        }

        waitForExpectations(timeout: 30, handler: nil)
        XCTAssertNotNil(data)
    }

}
