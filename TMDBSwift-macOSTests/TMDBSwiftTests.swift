//
//  TMDBSwiftTests.swift
//  TMDBSwiftTests
//
//  Created by George Kye on 2016-04-07.
//  Copyright © 2016 George Kye. All rights reserved.
//

import XCTest
@testable import TMDBSwift
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class TMDBSwiftTests: XCTestCase {  
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
		TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
  //MARK: CollectionMDB Test
  
  func testCollection() {
    var data: CollectionMDB?
    let expectation = self.expectation(description: "Wait for data to load.")
		
    CollectionMDB.collection(collectionId: 10){
      _, collection in
      data = collection
      expectation.fulfill()
    }
		
    waitForExpectations(timeout: 30, handler: nil)
    XCTAssertNotNil(data)
		
    XCTAssertEqual(data?.id, 10)
    XCTAssertEqual(data?.name, "Star Wars Collection")
    XCTAssertNotNil(data?.backdrop_path)
    XCTAssertNotNil(data?.overview)
    XCTAssertNotNil(data?.collectionItems)
    XCTAssertTrue(data?.collectionItems.count > 0)
    XCTAssertNotNil(data?.poster_path)
  }

//  //MARK: Configuration
	
  func testConfiguration() {
    var data: ConfigurationMDB?
    let expectation = self.expectation(description: "Wait for data to load.")
		
		
    ConfigurationMDB.configuration(){
      _, config in
      data = config
      expectation.fulfill()
    }
		
    waitForExpectations(timeout: 30, handler: nil)
    XCTAssertNotNil(data)
    XCTAssertTrue(data?.backdrop_sizes.count > 0)
    XCTAssertEqual(data?.base_url, "http://image.tmdb.org/t/p/")
    XCTAssertEqual(data?.secure_base_url, "https://image.tmdb.org/t/p/")
    XCTAssertTrue(data?.change_keys.count > 0)
    XCTAssertTrue(data?.logo_sizes.count > 0)
    XCTAssertTrue(data?.poster_sizes.count > 0)
    XCTAssertTrue(data?.still_sizes.count > 0)
    XCTAssertTrue(data?.logo_sizes.count > 0)
		
  }


//  //MARK: Company
	
  func testCompany() {
    var data: CompanyMDB?
    let expectation = self.expectation(description: "Wait for data to load.")
		
    CompanyMDB.companyInfo(companyId: 5){
      _, company in
      data = company
      expectation.fulfill()
    }
		
    waitForExpectations(timeout: 5, handler: nil)
    XCTAssertNotNil(data)
		
    XCTAssertEqual(data?.id, 5)
    XCTAssertEqual(data?.name, "Columbia Pictures")
    XCTAssertNotNil(data?.logo_path)
    XCTAssertEqual(data?.homepage, "http://www.sonypictures.com/")
    XCTAssertNotNil(data?.description)
    XCTAssertNotNil(data?.headquarters)
//    XCTAssertEqual(data?.parent_company?.name, "Sony Pictures Entertainment")
//    XCTAssertEqual(data?.parent_company?.id, 5752)
//    XCTAssertNotNil(data?.parent_company?.logo_path)
  }
}
