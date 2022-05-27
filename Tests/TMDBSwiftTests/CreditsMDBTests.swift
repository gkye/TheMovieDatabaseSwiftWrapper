//
//  CreditsMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/27/22.
//

@testable import TMDBSwift
import XCTest

final class CreditsMDBTests: XCTestCase {
    let expecationTimeout: TimeInterval = 50

    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testChanges() {
        var data: CreditsMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        CreditsMDB.credits(creditID: "549edca3c3a3682f1b0084f1") { _, credits in
            data = credits
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }
}
