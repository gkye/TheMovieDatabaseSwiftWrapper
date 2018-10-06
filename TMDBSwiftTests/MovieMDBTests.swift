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
	
	//Get the cast and crew information for a specific movie id.
	
	
	func testCredits(){
		var data: MovieCreditsMDB?
		let expectation = self.expectation(description: "Wait for data to load.")
		
		MovieMDB.credits(movieID: 7984){
			_, creds in
			data = creds
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertNotNil(data?.cast)
		XCTAssertNotNil(data?.crew)
		
		//cast
		XCTAssertEqual(data?.cast[0].cast_id, 4)
		XCTAssertEqual(data?.cast[0].name, "Daniel Day-Lewis")
		XCTAssertEqual(data?.cast[0].credit_id, "52fe448bc3a36847f809c0b5")
		XCTAssertEqual(data?.cast[0].id, 11856)
		XCTAssertEqual(data?.cast[0].order, 0)
		//    XCTAssertEqual(data?.cast[0].profile_path, "/hknfCSSU6AMeKV9yn9NTtTzIEGc.jpg")
		
		//crew
		XCTAssertEqual(data?.crew[0].credit_id, "52fe448bc3a36847f809c0a5")
		XCTAssertEqual(data?.crew[0].department, "Directing")
		XCTAssertEqual(data?.crew[0].id, 53334)
		XCTAssertEqual(data?.crew[0].job, "Director")
		XCTAssertEqual(data?.crew[0].name, "Jim Sheridan")
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
		var data: [KeywordsMDB]?
		let expectation = self.expectation(description: "Wait for data to load.")
		
		MovieMDB.keywords(movieID: 871){
			_, kwords in
			data = kwords
			expectation.fulfill()
		}
		
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertNotNil(data)
		XCTAssertEqual(data?[0].name, "human evolution")
		XCTAssertEqual(data?[0].id, 311)
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
		XCTAssertEqual(data?[2].release_dates[0].certification, "15")
//		XCTAssertEqual(dates?.iso_639_1, "")
//		XCTAssertEqual(dates?.note, "")
//    XCTAssertEqual(dates?.release_date, "1969-09-25T00:00:00.000Z")
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
		XCTAssertEqual(vids?.name, "Planet of the Apes (1968) trailer")
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
		var cReturn: ClientReturn?
		var movieData: MovieDetailedMDB?
		var videos: [VideosMDB]?
		var reviews: [MovieReviewsMDB]?
		let expectation = self.expectation(description: "Wait for data to load.")
		
    MovieMDB.movieAppendTo(movieID: 49026, append_to: ["videos", "reviews"], completion: {
      api, movie, json in
      cReturn = api
      movieData = movie
      if let data = cReturn?.data,
        let decodedVideoWrapper = try? JSONDecoder().decode(ResponseWrapper.self, from: data),
        let decodedReviewWrapper = try? JSONDecoder().decode(ResponseWrapper.self, from: data) {
        expectation.fulfill()
        
        videos = decodedVideoWrapper.videos?.results
        reviews = decodedReviewWrapper.reviews?.results
      }
    })
		
		waitForExpectations(timeout: 5, handler: nil)
		
		XCTAssertNotNil(movieData)
		XCTAssertNotNil(cReturn?.json)
		XCTAssertNotNil(videos)
		XCTAssertNotNil(reviews)
		
		XCTAssertEqual(videos?.count, 4)
		
		let review = reviews?[0]
		
		XCTAssertEqual(review?.id, "5010553819c2952d1b000451")
		XCTAssertEqual(review?.author, "Travis Bell")
		XCTAssertNotNil(review?.content)
		XCTAssertEqual(review?.url, "https://www.themoviedb.org/review/5010553819c2952d1b000451")
	}
	
}
