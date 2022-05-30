//
//  ConfigurationsMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/30/22.
//

@testable import TMDBSwift
import XCTest

final class ConfigurationsMDBTests: XCTestCase {
    let expecationTimeout: TimeInterval = 50

    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testConfiguration() {
        var data: ConfigurationMDB?
        let expectation = self.expectation(description: "Wait for data to load.")

        ConfigurationMDB.configuration { _, config in
            data = config
            expectation.fulfill()
        }

        waitForExpectations(timeout: 30, handler: nil)
        XCTAssertNotNil(data)
        XCTAssertGreaterThan(data?.backdrop_sizes?.count ?? 0, 0)
        XCTAssertEqual(data?.base_url, "http://image.tmdb.org/t/p/")
        XCTAssertEqual(data?.secure_base_url, "https://image.tmdb.org/t/p/")
        XCTAssertGreaterThan(data?.change_keys?.count ?? 0, 0)
        XCTAssertGreaterThan(data?.logo_sizes?.count ?? 0, 0)
        XCTAssertGreaterThan(data?.poster_sizes?.count ?? 0, 0)
        XCTAssertGreaterThan(data?.still_sizes?.count ?? 0, 0)
        XCTAssertGreaterThan(data?.logo_sizes?.count ?? 0, 0)
    }

}
