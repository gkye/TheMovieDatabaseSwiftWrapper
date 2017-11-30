//
//  MovieMDBTests.swift
//  TMDBSwift
//
//  Created by George Kye on 2016-07-03.
//  Copyright © 2016 George Kye. All rights reserved.
//

import XCTest
@testable import TMDBSwift

class MovieMDBTests: XCTestCase {
	
	override func setUp() {
		super.setUp()
		TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	//MOVIE TESTS
	
	func testDiscover(){
		var data: [MovieMDB]!
		let expectation = self.expectation(description: "Wait for data to load.")
		
		MovieMDB.discoverMovies(params: [.page(1), .language("en"), .vote_count_gte(10000)], completion: {
			api, movie in
			data = movie
			expectation.fulfill()
		})
		waitForExpectations(timeout: 50, handler: nil)
		XCTAssertNotNil(data[0])
		XCTAssertNotNil(data[0].title)
		XCTAssertNotNil(data[0].overview)
		XCTAssertNotNil(data[0].id)
		XCTAssertNotNil(data[0].vote_average)
	}
	
	func testMovieById() {
		var data: MovieDetailedMDB?
		let expectation = self.expectation(description: "Wait for data to load.")
		
		MovieMDB.movie(movieID: 7984){
			_, movie in
			data = movie
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertNotNil(data)
		XCTAssertEqual(data?.title, "In the Name of the Father")
		
	}
	
	//Get the alternative titles for a specific movie id.
	func testAlternateTitles(){
		var data: Alternative_TitlesMDB?
		let expectation = self.expectation(description: "Wait for data to load.")
		MovieMDB.alternativeTitles(movieID: 7984){
			_, titles in
			data = titles
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertNotNil(data)
		XCTAssertEqual(data?.titles[0].title, "Au Nom du Père")
		XCTAssertEqual(data?.titles[0].iso_3166_1, "FR")
	}
  
  func testRecommendations(){
    var recommendations: [MovieMDB]!
    let expectation = self.expectation(description: "Wait for data to load.")
    MovieMDB.recommendations(movieID: 49026, page: 1, language: "en", completion: {
      _, data in
      recommendations = data
      expectation.fulfill()
    })
    waitForExpectations(timeout: 5, handler: nil)
    XCTAssert(recommendations.count > 0)
    
  }
	
	//Get the cast and crew information for a specific movie id.
	
	
	func testCredits(){
		var credits: MovieCreditsMDB?
		let expectation = self.expectation(description: "Wait for data to load.")
		
		MovieMDB.credits(movieID: 7984){
			_, creds in
			credits = creds
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertNotNil(credits?.cast)
		XCTAssertNotNil(credits?.crew)
		
		//cast
		XCTAssertEqual(credits?.cast[0].cast_id, 4)
		XCTAssertEqual(credits?.cast[0].name, "Daniel Day-Lewis")
		XCTAssertEqual(credits?.cast[0].credit_id, "52fe448bc3a36847f809c0b5")
		XCTAssertEqual(credits?.cast[0].id, 11856)
		XCTAssertEqual(credits?.cast[0].order, 0)
		//    XCTAssertEqual(data?.cast[0].profile_path, "/hknfCSSU6AMeKV9yn9NTtTzIEGc.jpg")
		
		//crew
		XCTAssertEqual(credits?.crew[0].credit_id, "52fe448bc3a36847f809c0a5")
		XCTAssertEqual(credits?.crew[0].department, "Directing")
		XCTAssertEqual(credits?.crew[0].id, 53334)
		XCTAssertEqual(credits?.crew[0].job, "Director")
		XCTAssertEqual(credits?.crew[0].name, "Jim Sheridan")
		//    XCTAssertEqual(data?.crew[0].profile_path, "/mfukw1JcUsXmUzt6IoaayMaescv.jpg")
		
	}
	
	//  Get the images (posters and backdrops) for a specific movie id.
	
	func testImages(){
		var data: ImagesMDB?
		let expectation = self.expectation(description: "Wait for data to load.")
		MovieMDB.images(movieID: 871){
			_, imgs in
			data = imgs
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertNotNil(data)
		XCTAssertNotNil(data?.backdrops)
		XCTAssertNotNil(data?.posters)
		XCTAssertEqual(data?.stills.count, 0)
		//backdrops
		XCTAssertNotNil(data?.backdrops[0].aspect_ratio)
		XCTAssertNotNil(data?.backdrops[0].file_path)
		XCTAssertNotNil(data?.backdrops[0].height)
		XCTAssertEqual(data?.backdrops[0].iso_639_1, nil)
		XCTAssertNotNil(data?.backdrops[0].vote_average)
		XCTAssertNotNil(data?.backdrops[0].vote_count)
		XCTAssertNotNil(data?.backdrops[0].width)
	}
	
	
	//Get the plot keywords for a specific movie id.
	
	func testKeywords(){
		var keywords: [KeywordsMDB]?
		let expectation = self.expectation(description: "Wait for data to load.")
		MovieMDB.keywords(movieID: 871){
			_, kwords in
			keywords = kwords
			expectation.fulfill()
		}		
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertNotNil(keywords)
		XCTAssertEqual(keywords?[0].name, "human evolution")
		XCTAssertEqual(keywords?[0].id, 311)
	}
	
	//Get the release dates, certifications and related information by country for a specific movie id.
	
	func testReleaseDates(){
		var data: [MovieReleaseDatesMDB]?
		let expectation = self.expectation(description: "Wait for data to load.")
		
		MovieMDB.release_dates(movieID: 871){
			_, dates in
			data = dates
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertNotNil(data)
		let dates = data?[0].release_dates[0]
		XCTAssertNotNil(data?[0].iso_3166_1)
		XCTAssertNotNil(dates?.certification)
		//cert test 2
		XCTAssertEqual(data?[2].release_dates[0].certification, "12")
//		XCTAssertEqual(dates?.iso_639_1, "")
//		XCTAssertEqual(dates?.note, "")
		XCTAssertEqual(dates?.release_date,  "1969-09-25T00:00:00.000Z")
		XCTAssertEqual(dates?.type, 3)
	}
	
	//Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
	func testVideos(){
		var data: [VideosMDB]?
		let expectation = self.expectation(description: "Wait for data to load.")
		
		MovieMDB.videos(movieID: 871){
			_, vids in
			data = vids
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertNotNil(data)
		let vids = data?[0]
		XCTAssertEqual(vids?.id, "533ec657c3a3685448000674")
		XCTAssertEqual(vids?.iso_639_1, "en")
		XCTAssertEqual(vids?.key, "VjcpRHuPjOI")
		XCTAssertEqual(vids?.name, "Trailer 1")
		XCTAssertEqual(vids?.site, "YouTube")
		XCTAssertEqual(vids?.size, 360)
		XCTAssertEqual(vids?.type, "Trailer")
	}
	
	//Get the lists that the movie belongs to.
	func testList(){
		var data: [MovieListMDB]?
		let expectation = self.expectation(description: "Wait for data to load.")
		
		MovieMDB.list(movieID: 871, page: 1){
			_, lists in
			data = lists
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertNotNil(data)
		
		let list = data?[0]
		dump(list)
		XCTAssertNotNil(list?.description)
		XCTAssertNotNil(list?.favorite_count)
		XCTAssertNotNil(list?.id)
		XCTAssertNotNil(list?.iso_639_1)
		XCTAssertNotNil(list?.name)
	}
	
	/// Get the similar movies for a specific movie id.
	func testSimilar(){
		var data: [MovieMDB]?
		let expectation = self.expectation(description: "Wait for data to load.")
		MovieMDB.similar(movieID: 871, page: 1){
			_, movies in
			data = movies
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertNotNil(data)
	}
	
	/// Get the reviews for a particular movie id.
	func testReviews(){
		var data: [MovieReviewsMDB]?
		let expectation = self.expectation(description: "Wait for data to load.")
		MovieMDB.reviews(movieID: 49026, page: 1){
			_, reviews in
			data = reviews
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertNotNil(data)
		let review = data?[0]
		XCTAssertEqual(review?.id, "5010553819c2952d1b000451")
		XCTAssertEqual(review?.author, "Travis Bell")
		XCTAssertNotNil(review?.content)
		XCTAssertEqual(review?.url, "https://www.themoviedb.org/review/5010553819c2952d1b000451")
		
	}
	
	//  //Append to response (Retrieve multiple movie object with one request). Object must be manually initialized using the JSON returned.
	
	func testAppendTo(){
		var apiData: ClientReturn!
		var movieData: MovieDetailedMDB!
		var videos: [VideosMDB]!
		var reviews: [MovieReviewsMDB]!
    var altTitles: Alternative_TitlesMDB!
    var images: ImagesMDB!
    var keywords: [KeywordsMDB]!
    var credits: MovieCreditsMDB!
    var releaseDates: [MovieReleaseDatesMDB]!
    var recommendations: [MovieMDB]!
    var translations: TranslationsMDB!
    var similarMovies: [MovieMDB]!
    var lists: [ListsMDB]!
    
		let expectation = self.expectation(description: "Wait for data to load.")

    MovieMDB.movie(movieID: 49026, append_to: [.videos, .reviews, .alternative_titles, .images, .keywords, .movieCredits, .release_dates, .translations, .similarMovies, .recommendationsMovies, .lists], language: "en", completion: {
      (api, movie, AppendToResponseData, json) in
      movieData = movie
      apiData = api
      for item in AppendToResponseData{
        switch item {
        case .videos(let vids): videos = vids
        case .movieReviews(let reviews_): reviews = reviews_
        case .alternative_titles(let titles): altTitles = titles
        case .images(let imgs): images = imgs
        case .keywords(let keywrds): keywords = keywrds
        case .movieCredits(let creds): credits = creds
        case .release_dates(let dates): releaseDates = dates
        case .translations(let trans): translations = trans
        case .similarMovies(let movies): similarMovies = movies
        case .recommendationsMovies(let movies): recommendations = movies
        case .lists(let lists_): lists = lists_
        }
      }
      expectation.fulfill()
    })
    
		waitForExpectations(timeout: 50, handler: nil)
		XCTAssertNotNil(movieData)
		XCTAssertNotNil(apiData.json)
    
		XCTAssertNotNil(videos)
    XCTAssert(videos.count > 0)
    
    XCTAssertNotNil(reviews)
    XCTAssert(reviews.count > 0)
    
    XCTAssertNotNil(images)
    XCTAssertNotNil(images.backdrops)
    XCTAssertNotNil(images.posters)
    
    XCTAssert(altTitles.titles.count > 0)
    
    XCTAssert(keywords.count > 0)
    
    XCTAssertNotNil(credits?.cast.count ?? 0 > 0)
    XCTAssertNotNil(credits?.crew.count ?? 0 > 0)
    
    XCTAssertNotNil(releaseDates)
    XCTAssert(releaseDates.count > 0)
    
    XCTAssertNotNil(translations)
    
    XCTAssertTrue(similarMovies.count > 0)
    
    XCTAssertTrue(lists.count > 0)
    
    XCTAssertTrue(recommendations.count > 0)
	}
	
}
