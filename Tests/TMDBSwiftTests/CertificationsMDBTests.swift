//
//  CertificationsMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/26/22.
//

@testable import TMDBSwift
import XCTest

final class CertificationsMDBTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testTVCertifications() {
        var data: TVCertifications!
        let expectation = self.expectation(description: "Wait for data to load.")

        CertificationsMDB.tv { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data.US)
    }
}
