//
//  PersonMDBTests.swift
//  TMDBSwift-iOS
//
//  Created by Martin Pfundmair on 2018-10-13.
//  Copyright © 2018 George. All rights reserved.
//

import XCTest
@testable import TMDBSwift

final class PersonMDBTests: XCTestCase {

    let expecationTimeout: TimeInterval = 50

    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPersonById() {
        var data: PersonMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        PersonMDB.person_id(personID: 19429) { _, person in
            data = person
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data.adult)
        XCTAssertNotNil(data.also_known_as)
        XCTAssertNotNil(data.biography)
        XCTAssertEqual(data.deathday, "1973-07-20")
        XCTAssertNotNil(data.homepage)
        XCTAssertEqual(data.id, 19429)
        XCTAssertNotNil(data.imdb_id)
        XCTAssertEqual(data.name, "Bruce Lee")
        XCTAssertNotNil(data.place_of_birth)
        XCTAssertNotNil(data.popularity)
        XCTAssertNotNil(data.profile_path)
    }

    func testMovieCredits() {
        var data: PersonMovieCredits!
        let expectation = self.expectation(description: "Wait for data to load.")

        PersonMDB.movie_credits(personID: 19429, language: nil) { _, personMovieCredits in
            data = personMovieCredits
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertEqual(data.id, 19429)
        XCTAssertNotNil(data.crew)
        XCTAssertNotNil(data.cast)
    }

    func testTvCredits() {
        var data: PersonTVCredits!
        let expectation = self.expectation(description: "Wait for data to load.")

        PersonMDB.tv_credits(personID: 19429, language: nil) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertEqual(data.id, 19429)
        XCTAssertNotNil(data.crew)
        XCTAssertNotNil(data.cast)
    }

    func testCombinedCredits() {
        var data: PersonCreditsCombined!
        let expectation = self.expectation(description: "Wait for data to load.")

        PersonMDB.combined_credits(personID: 19429, language: nil) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertEqual(data.id, 19429)
        XCTAssertNotNil(data.movieCredits.cast)
        XCTAssertNotNil(data.movieCredits.crew)
        XCTAssertNotNil(data.tvCredits.cast)
        XCTAssertNotNil(data.tvCredits.crew)
    }

    func testPersonTVCrew() {
        var data: PersonCreditsCombined!
        let expectation = self.expectation(description: "Wait for data to load.")

        PersonMDB.combined_credits(personID: 9813, language: nil) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertEqual(data.id, 9813)
        XCTAssertNotNil(data.movieCredits)
        XCTAssertNotNil(data.tvCredits)
        XCTAssertNotNil(data.tvCredits.crew)
    }

    func testExternalIDs() {
        var data: ExternalIdsMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        PersonMDB.externalIDS(personID: 19429) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertEqual(data.id, 19429)
        XCTAssertNotNil(data.imdb_id)
        XCTAssertNotNil(data.freebase_mid)
        XCTAssertNotNil(data.freebase_id)
        XCTAssertNotNil(data.tvrage_id)
    }

    func testImages() {
        var data: [ImageMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        PersonMDB.images(personID: 19429) { _, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data.first?.aspect_ratio)
        XCTAssertNotNil(data.first?.file_path)
        XCTAssertNotNil(data.first?.height)
        XCTAssertNotNil(data.first?.vote_average)
        XCTAssertNotNil(data.first?.vote_count)
        XCTAssertNotNil(data.first?.width)
    }

    func testTaggedImagesAndPageResults() {
        var data: TaggedImagesMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        PersonMDB.tagged_images(personID: 19429, page: 1) { _, images in
            data = images
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertEqual(data.id, 19429)
        XCTAssertNotNil(data.images.first?.file_path)
        XCTAssertNotNil(data.pageResults.total_pages)
        XCTAssertNotNil(data.pageResults.total_results)
        XCTAssertNotNil(data.pageResults.page)
    }

    func testTaggedImages_tv() {
        var data: TaggedImagesMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        PersonMDB.tagged_images(personID: 1223786, page: 1) { _, images in
            data = images
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertEqual(data.id, 1223786)
        XCTAssertNotNil(data.images.first?.file_path)
        XCTAssertNotNil(data.pageResults.total_pages)
        XCTAssertNotNil(data.pageResults.total_results)
        XCTAssertNotNil(data.pageResults.page)
    }

    func testLatest() {
        var data: PersonMDB!
        let expectation = self.expectation(description: "Wait for data to load.")

        PersonMDB.latest { _, person in
            data = person
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data.id)
    }

    func testPopular_AndPageResults() {
        var data: [PersonResults]!
        let expectation = self.expectation(description: "Wait for data to load.")

        PersonMDB.popular(page: 1) { responseApi, responseData in
            data = responseData
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data.first)
    }
}
