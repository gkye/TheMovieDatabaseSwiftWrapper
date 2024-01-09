//
//  CompanyMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/29/22.
//

@testable import TMDBSwift
import XCTest

final class CompanyMDBTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testCompanyInfo() {
        var data: CompanyMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        CompanyMDB.companyInfo(companyId: 5) { _, company in
            data = company
            expectation.fulfill()
        }

        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNotNil(data)

        XCTAssertEqual(data?.id, 5)
        XCTAssertEqual(data?.name, "Columbia Pictures")
        XCTAssertNotNil(data?.logo_path)
        XCTAssertEqual(data?.homepage, "http://www.sonypictures.com")
        XCTAssertNotNil(data?.description)
        XCTAssertNotNil(data?.headquarters)
    }

    func testCompanyMovies() {
        var data: [MovieMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        CompanyMDB.companyMovies(companyId: 5, language: "en-US", page: 1) { _, company in
            data = company
            expectation.fulfill()
        }

        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertGreaterThan(data.count, 0)
    }
}
