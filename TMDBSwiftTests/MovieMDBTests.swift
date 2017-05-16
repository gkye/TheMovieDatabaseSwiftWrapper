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
  var key = "8a7a49369d1af6a70ec5a6787bbfcf79"
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  //MOVIE TESTS
  
  func testMovieById() {
    var data: MovieDetailedMDB?
    let expectation = self.expectation(description: "Wait for data to load.")
    
    MovieMDB.movie(key, movieID: 7984){
      movie in
      data = movie.1
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
    
    MovieMDB.alternativeTitles(key, movieID: 7984){
      titles in
      data = titles.1
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
    
    MovieMDB.credits(key, movieID: 7984){
      creds in
      data = creds.1
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
    
    MovieMDB.images(key, movieID: 871){
      imgs in
      data = imgs.1
      expectation.fulfill()
    }
    
    waitForExpectations(timeout: 5, handler: nil)
    XCTAssertNotNil(data)
    XCTAssertNotNil(data?.backdrops)
    XCTAssertNotNil(data?.posters)
    XCTAssertEqual(data?.stills.count, 0)
    
    //backdrops
    XCTAssertEqual(data?.backdrops[0].aspect_ratio, 1.77777777777778)
    XCTAssertEqual(data?.backdrops[0].file_path, "/u4s4b3xRz5gOHwzO2KneDqIl7Bf.jpg")
    XCTAssertEqual(data?.backdrops[0].height, 1080)
    XCTAssertEqual(data?.backdrops[0].iso_639_1, nil)
    XCTAssertEqual(data?.backdrops[0].vote_average, 5.61224489795918)
    XCTAssertEqual(data?.backdrops[0].vote_count, 7)
    XCTAssertEqual(data?.backdrops[0].width, 1920)
    
  }
  
  //Get the plot keywords for a specific movie id.
  
  func testKeywords(){
    var data: [KeywordsMDB]?
    let expectation = self.expectation(description: "Wait for data to load.")
    
    MovieMDB.keywords(key, movieID: 871){
      kwords in
      data = kwords.1
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
    
    MovieMDB.release_dates(key, movieID: 871){
      dates in
      data = dates.1
      expectation.fulfill()
    }
    waitForExpectations(timeout: 5, handler: nil)
    XCTAssertNotNil(data)
    let dates = data?[0].release_dates[0]
    XCTAssertEqual(data?[0].iso_3166_1, "FR")
    XCTAssertEqual(dates?.certification, "")
    //cert test 2
    XCTAssertEqual(data?[2].release_dates[0].certification, "12")
    XCTAssertEqual(dates?.iso_639_1, "")
    XCTAssertEqual(dates?.note, "")
    XCTAssertEqual(dates?.release_date,  "1968-04-25T00:00:00.000Z")
    XCTAssertEqual(dates?.type, 3)
  }
  
  //Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
  func testVideos(){
    var data: [VideosMDB]?
    let expectation = self.expectation(description: "Wait for data to load.")
    
    MovieMDB.videos(key, movieID: 871){
      vids in
      data = vids.1
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
    
    MovieMDB.list(key, movieID: 871, page: 1){
      lists in
      data = lists.1
      expectation.fulfill()
    }
    waitForExpectations(timeout: 5, handler: nil)
    XCTAssertNotNil(data)
    
    let list = data?[0]
    XCTAssertEqual(list?.description, "Movies with unexpected mind-blowing plot twist. List created by Movie Roll App.")
    XCTAssertEqual(list?.favorite_count, 30)
    XCTAssertEqual(list?.id, "52064ff019c2955c3a0a2b42")
    XCTAssertEqual(list?.item_count, 27)
    XCTAssertEqual(list?.iso_639_1, "en")
    XCTAssertEqual(list?.name, "Greatest Twist Ending")
    XCTAssertEqual(list?.poster_path, "/jxfS4WLDBPY5hbosEDeCRQfE0gM.jpg")
  }
  
  //Get the similar movies for a specific movie id.
  //TODO: improve tests
  func testSimilar(){
    var data: [MovieMDB]?
    let expectation = self.expectation(description: "Wait for data to load.")
    
    MovieMDB.similar(key, movieID: 871, page: 1){
      movies in
      data = movies.1
      expectation.fulfill()
    }
    waitForExpectations(timeout: 5, handler: nil)
    XCTAssertNotNil(data)
  }
  
  //Get the reviews for a particular movie id.
  func testReviews(){
    var data: [MovieReviewsMDB]?
    let expectation = self.expectation(description: "Wait for data to load.")
    
    MovieMDB.reviews(key, movieID: 49026, page: 1){
      rev in
      data = rev.1
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
  
  //Append to response (Retrieve multiple movie object with one request). Object must be manually initialized using the JSON returned.
  func testAppendTo(){
    var cReturn: ClientReturn?
    var movieData: MovieDetailedMDB?
    var videos: [VideosMDB]?
    var reviews: [MovieReviewsMDB]?
    let expectation = self.expectation(description: "Wait for data to load.")

    MovieMDB.movieAppendTo(key, movieID: 49026, append_to: ["videos", "reviews"]){
      data in
      cReturn = data.0
      movieData = data.1
      if let json = data.2 {
        videos = VideosMDB.initialize(json: json["videos"]["results"])
        reviews = MovieReviewsMDB.initialize(json: json["reviews"]["results"])
      }
      expectation.fulfill()
    }
    
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
