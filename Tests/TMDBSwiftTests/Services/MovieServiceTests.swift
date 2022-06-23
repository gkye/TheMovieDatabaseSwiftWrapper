@testable import TMDBSwift
import XCTest

final class MovieServiceTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testDetails() async throws {
        let data = try await MovieService.shared.details(for: 11)
        XCTAssertNotNil(data)
    }

    func testFetchDetails() {
        var data: Movie?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService.shared.fetchDetails(for: 11) { movie in
            data = movie
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testAlternativeTitles() async throws {
        let data = try await MovieService.shared.alternativeTitles(for: 11)
        XCTAssertNotNil(data)
    }

    func testFetchAlternativeTitles() {
        var data: [Title]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService.shared.fetchAlternativeTitles(for: 11) { titles in
            data = titles
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testExternalIDs() async throws {
        let data = try await MovieService.shared.externalIDs(for: 11)
        XCTAssertFalse(data.isEmpty)
    }

    func testFetchExternalIDs() {
        var data: [ExternalIDType]?
        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService.shared.fetchExternalIDs(for: 11) { types in
            data = types
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }
}
