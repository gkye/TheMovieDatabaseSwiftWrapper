//
//  CastCrewMDBTests.swift
//  TMDBSwift-iOS
//
//  Created by Martin Pfundmair on 2018-11-03.
//  Copyright © 2018 George. All rights reserved.
//

import XCTest
@testable import TMDBSwift

class TVMDBTests: XCTestCase {

  let expecationTimeout: TimeInterval = 50

  override func setUp() {
    super.setUp()
    TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
  }

  override func tearDown() {
    super.tearDown()
  }

  func testTVShowById() {
    var data: TVDetailedMDB!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.tv(tvShowID: 1399, language: nil) { api, show in
      data = show
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertEqual(data.first_air_date, "2011-04-17")
    XCTAssertEqual(data.id, 1399)
    XCTAssertEqual(data.original_name, "Game of Thrones")
    XCTAssertNotNil(data.genres)
    XCTAssertNotNil(data.production_companies)
    XCTAssertNotNil(data.number_of_seasons)
    XCTAssertNotNil(data.homepage)
    XCTAssertNotNil(data.seasons)
    XCTAssertNotNil(data.popularity)
  }

  func testAlternativeTitlesById() {
    var data: Alternative_TitlesMDB!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.alternativeTitles(tvShowID: 1399) { api, titles in
      data = titles
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertEqual(data.id, 1399)
    XCTAssertTrue(data.titles.contains(where: { $0.iso_3166_1 == "DE" && $0.title == "Game of Thrones - Das Lied von Eis und Feuer" }))
  }

  func testContentRatings() {
    var data: [Content_RatingsMDB]!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.content_ratings(tvShowID: 1399) { api, ratings in
      data = ratings
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertTrue(data.count != 0)
    XCTAssertNotNil(data.first?.rating)
    XCTAssertNotNil(data.first?.iso_3166_1)
  }

  func testCredits() {
    var data: TVCreditsMDB!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.credits(tvShowID: 1399) { api, credits in
      data = credits
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertTrue(data.cast.count > 0)
    XCTAssertTrue(data.crew.count > 0)
  }

  func testExternalIDs() {
    var data: ExternalIdsMDB!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.externalIDS(tvShowID: 1399, language: nil) { api, externalIDs in
      data = externalIDs
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertEqual(data.id, 1399)
    XCTAssertEqual(data.imdb_id, "tt0944947")
  }

  func testImages() {
    var data: ImagesMDB!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.images(tvShowID: 1399, language: nil) { api, images in
      data = images
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertEqual(data.id, 1399)
    XCTAssertTrue(data.backdrops.count > 0)
    XCTAssertTrue(data.posters.count > 0)
    XCTAssertNotNil(data.posters.first?.file_path)
    XCTAssertNotNil(data.posters.first?.height)
    XCTAssertNotNil(data.posters.first?.width)
  }

  func testKeywords() {
    var data: [KeywordsMDB]!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.keywords(tvShowID: 1399) { api, keywords in
      data = keywords
      print(data.first.debugDescription)
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertNotNil(data.first?.id)
    XCTAssertNotNil(data.first?.name)
  }

  func testSimilar() {
    var data: [TVMDB]!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.similar(tvShowID: 1399, page: nil, language: nil) { api, similar in
      data = similar
      print(data.first.debugDescription)
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertNotNil(data.first?.genres)
    XCTAssertNotNil(data.first?.backdrop_path)
    XCTAssertNotNil(data.first?.first_air_date)
  }

  func testTranslations() {
    var data: [TranslationsMDB]!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.translations(tvShowID: 1399) { api, translations in
      data = translations
      print(data.first.debugDescription)
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
//    XCTAssertNotNil()
    XCTAssertNotNil(data.first?.english_name)
    XCTAssertNotNil(data.first?.iso_639_1)
    XCTAssertNotNil(data.first?.name)
  }

  func testVideos() {
    var data: [VideosMDB]!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.videos(tvShowID: 1399, language: nil) { api, videos in
      data = videos
      print(data.first.debugDescription)
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertNotNil(data.first?.id)
    XCTAssertNotNil(data.first?.iso_639_1)
    XCTAssertNotNil(data.first?.size)
    XCTAssertNotNil(data.first?.type)
  }

  func testLatest() {
    var data: TVDetailedMDB!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.latest() { api, latest in
      data = latest
      print(data.debugDescription)
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertNotNil(data.id)
  }

  func testOnTheAir() {
    var data: [TVMDB]!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.ontheair(page: nil, language: nil) { api, ota in
      data = ota
      print(data.first.debugDescription)
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertNotNil(data.first?.id)
  }

  func testAiringToday() {
    var data: [TVMDB]!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.airingtoday(page: nil, language: nil, timezone: nil) { api, today in
      data = today
      print(data.first.debugDescription)
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertNotNil(data.first?.id)
  }

  func testTopRated() {
    var data: [TVMDB]!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.toprated(page: nil, language: nil) { api, toprated in
      data = toprated
      print(data.first.debugDescription)
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertNotNil(data.first?.id)
  }

  func testPopular() {
    var data: [TVMDB]!
    let expectation = self.expectation(description: "Wait for data to load.")

    TVMDB.popular(page: nil, language: nil) { api, videos in
      data = videos
      print(data.first.debugDescription)
      expectation.fulfill()
    }

    waitForExpectations(timeout: expecationTimeout, handler: nil)
    XCTAssertNotNil(data.first?.id)
  }

  // TODO: query
  // TODO: tvAppendTo
}

