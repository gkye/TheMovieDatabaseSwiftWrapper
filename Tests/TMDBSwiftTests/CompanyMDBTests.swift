//
//  CompanyMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/29/22.
//

@testable import TMDBSwift
import XCTest

final class CompanyMDBTests: XCTestCase {
    let expecationTimeout: TimeInterval = 50

    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testCompanyInfo() {
        var data: CompanyMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        CompanyMDB.companyInfo(companyId: 100) { _, responseData in
            data = responseData
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }
}
