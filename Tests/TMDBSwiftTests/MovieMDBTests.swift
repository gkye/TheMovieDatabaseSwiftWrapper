//
//  MovieMDBTests.swift
//  TMDBSwift
//
//  Created by George Kye on 2016-07-03.
//  Copyright © 2016 George Kye. All rights reserved.
//

@testable import TMDBSwift
import XCTest

final class MovieMDBTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testDiscover() {
        var data: [MovieMDB]!
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.discoverMovies(params: [.page(1), .language("en"), .vote_count_gte(10000)], completion: { _, movie in
            data = movie
            expectation.fulfill()
        })
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data[0])
        XCTAssertNotNil(data[0].title)
        XCTAssertNotNil(data[0].overview)
        XCTAssertNotNil(data[0].id)
        XCTAssertNotNil(data[0].vote_average)
    }

    func testMovieById() {
        var data: MovieDetailedMDB?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.movie(movieID: 7984) { _, movie in
            data = movie
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
        XCTAssertEqual(data?.title, "In the Name of the Father")

    }

    // Get the alternative titles for a specific movie id.
    func testAlternateTitles() {
        var data: AlternativeMovieTitlesMDB!
        let expectation = self.expectation(description: "Wait for data to load.")
        MovieMDB.alternativeTitles(movieID: 7984, country: "CN") { _, titles in
            data = titles
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
        let french = data?.titles?.filter { $0.iso_3166_1 == "FR" }.first

        XCTAssertEqual(french?.title, "Au Nom du Père")
    }

    // Get the cast and crew information for a specific movie id.

    func testCredits() {
        var data: MovieCreditsMDB?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.credits(movieID: 7984) { _, creds in
            data = creds
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data?.cast)
        XCTAssertNotNil(data?.crew)

        // cast
        let danielDayLewis = data?.cast?.filter { $0.credit_id == "52fe448bc3a36847f809c0b5" }.first
        XCTAssertEqual(danielDayLewis?.cast_id, 4)
        XCTAssertEqual(danielDayLewis?.name, "Daniel Day-Lewis")
        XCTAssertEqual(danielDayLewis?.id, 11856)
        XCTAssertEqual(danielDayLewis?.order, 0)
        //    XCTAssertEqual(danielDayLewis?.profile_path, "/hknfCSSU6AMeKV9yn9NTtTzIEGc.jpg")

        // crew
        let jimSheridan = data?.crew?.filter { $0.credit_id == "52fe448bc3a36847f809c0a5" }.first

        XCTAssertEqual(jimSheridan?.department, "Directing")
        XCTAssertEqual(jimSheridan?.id, 53334)
        XCTAssertEqual(jimSheridan?.job, "Director")
        XCTAssertEqual(jimSheridan?.name, "Jim Sheridan")
        //    XCTAssertEqual(jimSheridan?.profile_path, "/aWTmBt44TyUCb0t50avtFsPdTPp.jpg")
    }

    //  Get the images (posters and backdrops) for a specific movie id.

    func testImages() {
        var data: ImagesMDB?
        let expectation = self.expectation(description: "Wait for data to load.")
        MovieMDB.images(movieID: 871, language: nil) { _, imgs in
            data = imgs
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
        XCTAssertNotNil(data?.backdrops)
        XCTAssertNotNil(data?.posters)
        XCTAssertEqual(data?.logos?.count ?? 0, 4)
        // backdrops
        XCTAssertNotNil(data?.backdrops?[0].aspect_ratio)
        XCTAssertNotNil(data?.backdrops?[0].file_path)
        XCTAssertNotNil(data?.backdrops?[0].height)
        XCTAssertEqual(data?.backdrops?[0].iso_639_1, nil)
        XCTAssertNotNil(data?.backdrops?[0].vote_average)
        XCTAssertNotNil(data?.backdrops?[0].vote_count)
        XCTAssertNotNil(data?.backdrops?[0].width)
    }

    // Get the plot keywords for a specific movie id.

    func testKeywords() {
        var data: [KeywordsMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.keywords(movieID: 871) { _, kwords in
            data = kwords
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
        XCTAssertEqual(data?[0].name, "human evolution")
        XCTAssertEqual(data?[0].id, 311)
    }

    // Get the release dates, certifications and related information by country for a specific movie id.

    func testReleaseDates() {
        var data: [MovieReleaseDatesMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.release_dates(movieID: 871) { _, dates in
            data = dates
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
        let dates = data?[0].release_dates[0]
        XCTAssertNotNil(data?[0].iso_3166_1)
        XCTAssertNotNil(dates?.certification)
    }

    // Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
    func testVideos() {
        var data: [VideosMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.videos(movieID: 871) { _, vids in
            data = vids
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)

        let planetOfTheApes = data?.filter { $0.id == "533ec657c3a3685448000678" }.first
        XCTAssertEqual(planetOfTheApes?.iso_639_1, "en")
        XCTAssertEqual(planetOfTheApes?.key, "mU9ZzgRPfR8")
        XCTAssertEqual(planetOfTheApes?.name, "John Landis on PLANET OF THE APES")
        XCTAssertEqual(planetOfTheApes?.site, "YouTube")
        XCTAssertEqual(planetOfTheApes?.size, 720)
        XCTAssertEqual(planetOfTheApes?.type, "Featurette")
    }

    // Get the lists that the movie belongs to.
    func testList() {
        var data: [MovieListMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.list(movieID: 871, page: 1) { _, lists in
            data = lists
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)

        let list = data?[0]
        XCTAssertNotNil(list?.description)
        XCTAssertNotNil(list?.favorite_count)
        XCTAssertNotNil(list?.id)
        XCTAssertNotNil(list?.iso_639_1)
        XCTAssertNotNil(list?.name)
    }

    /// Get the similar movies for a specific movie id.
    func testSimilar() {
        var data: [MovieMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")
        MovieMDB.similar(movieID: 871, page: 1) { _, movies in
            data = movies
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    /// Get the similar movies for a specific movie id.
    func testRecommendations() {
        var data: [MovieMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")
        MovieMDB.recommendations(movieID: 871, page: 1) { _, movies in
            data = movies
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    /// Get the reviews for a particular movie id.
    func testReviews() {
        var data: [MovieReviewsMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.reviews(movieID: 49026, page: 1) { _, reviews in
            data = reviews
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
        let review = data?[0]

        XCTAssertEqual(review?.id, "5010553819c2952d1b000451")
        XCTAssertEqual(review?.author, "Travis Bell")
        XCTAssertNotNil(review?.content)
        XCTAssertEqual(review?.url, "https://www.themoviedb.org/review/5010553819c2952d1b000451")

    }

    func testLatest() {
        var data: MovieDetailedMDB?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.latest { _, movie in
            data = movie
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testNowPlaying() {
        var data: [MovieMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.nowplaying(page: nil) { _, movies in
            data = movies
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testPopular() {
        var data: [MovieMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.popular(language: nil, page: nil) { _, movies in
            data = movies
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testTopRated() {
        var data: [MovieMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.toprated(language: nil, page: nil) { _, movies in
            data = movies
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testUpcoming() {
        var data: [MovieMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.upcoming(page: nil, language: nil) { _, movies in
            data = movies
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testQuery() {
        var data: [MovieMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.query(queryType: .nowplaying, language: nil, page: nil) { _, movies in
            data = movies
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testTranslations() {
        var data: [TranslationsMDB]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieMDB.translations(movieID: 7984) { _, translations in
            data = translations
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }
}
