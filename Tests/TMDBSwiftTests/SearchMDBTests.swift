//
//  SearchMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/27/22.
//

@testable import TMDBSwift
import XCTest

final class SearchMDBTests: XCTestCase {

    let expecationTimeout: TimeInterval = 50

    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCollection() {
        var data: [CollectionMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        SearchMDB.collection(query: "star wars", page: nil, language: nil) { _, collection in
            data = collection
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertGreaterThan(data.count, 0)
    }

    func testCompany() {
        var data: [ParentCompanyMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        SearchMDB.company(query: "miramax", page: nil) { _, company in
            data = company
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertGreaterThan(data.count, 0)
    }

    func testKeyword() {
        var data: [KeywordsMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        SearchMDB.keyword(query: "spider", page: nil) { _, keyword in
            data = keyword
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertGreaterThan(data.count, 0)
    }

    func testMovie() {
        var data: [MovieMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        SearchMDB.movie(query: "spider", language: nil, page: nil, includeAdult: nil, year: nil, primaryReleaseYear: nil) { _, movie in
            data = movie
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertGreaterThan(data.count, 0)
    }

    func testMulti() {
        var movies: [MovieMDB]!
        var tvshows: [TVMDB]!
        var people: [PersonResults]!
        let expectation = self.expectation(description: "Wait for data to load.")

        SearchMDB.multiSearch(query: "spider", page: nil, includeAdult: nil, language: nil, region: nil) { _, movie, tv, person in
            movies = movie
            tvshows = tv
            people = person
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertGreaterThan(movies.count, 0)
        XCTAssertGreaterThan(tvshows.count, 0)
        XCTAssertGreaterThan(people.count, 0)
    }

    func testPerson() {
        var data: [PersonResults]!
        let expectation = self.expectation(description: "Wait for data to load.")

        SearchMDB.person(query: "spider", page: nil, includeAdult: nil) { _, person in
            data = person
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertGreaterThan(data.count, 0)
    }

    func testTV() {
        var data: [TVMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        SearchMDB.tv(query: "spider", page: nil, language: nil, first_air_date_year: nil) { _, tvShows in
            data = tvShows
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertGreaterThan(data.count, 0)
    }
}
