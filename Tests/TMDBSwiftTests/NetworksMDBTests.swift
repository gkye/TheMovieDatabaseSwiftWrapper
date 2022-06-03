//
//  NetworksMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/27/22.
//

@testable import TMDBSwift
import XCTest

final class NetworksMDBTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testNetworks() {
        var data: NetworksMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        NetworksMDB.networks(networkId: 1) { _, network in
            data = network
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertEqual(data?.name, "Fuji TV")
        XCTAssertEqual(data?.id, 1.0)
    }
}
