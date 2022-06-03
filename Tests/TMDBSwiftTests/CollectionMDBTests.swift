//
//  CollectionMDBTests.swift
//  
//
//  Created by Dylan Pearce on 5/30/22.
//

@testable import TMDBSwift
import XCTest

final class CollectionMDBTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testCollection() {
        var data: CollectionMDB?
        let expectation = self.expectation(description: "Wait for data to load.")

        CollectionMDB.collection(collectionId: 10) { _, collection in
            data = collection
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)

        XCTAssertEqual(data?.id, 10)
        XCTAssertEqual(data?.name, "Star Wars Collection")
        XCTAssertNotNil(data?.backdrop_path)
        XCTAssertNotNil(data?.overview)
        XCTAssertNotNil(data?.collectionItems)
        XCTAssertTrue(data?.collectionItems?.count ?? 0 > 0)
        XCTAssertNotNil(data?.poster_path)
    }

    func testCollectionImages() {
        var data: ImagesMDB?
        let expectation = self.expectation(description: "Wait for data to load.")

        CollectionMDB.collectionImages(collectionId: 10, language: "en-US") { _, images in
            data = images
            expectation.fulfill()
        }

        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }
}
