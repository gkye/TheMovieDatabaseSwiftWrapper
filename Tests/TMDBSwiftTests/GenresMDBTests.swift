//
//  GenresMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/30/22.
//

@testable import TMDBSwift
import XCTest

final class GenresMDBTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testMovieGenres() {
        var data: [GenresMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        GenresMDB.genres(listType: .movie, language: nil) { _, genres in
            data = genres
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testTVGenres() {
        var data: [GenresMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        GenresMDB.genres(listType: .tv, language: nil) { _, genres in
            data = genres
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testGenreMovies() {
        var data: [MovieMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        GenresMDB.genre_movies(genreId: 28, include_adult_movies: false, language: "en-US") { _, movies in
            data = movies
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertGreaterThan(data?.count ?? 0, 0)
    }
}
