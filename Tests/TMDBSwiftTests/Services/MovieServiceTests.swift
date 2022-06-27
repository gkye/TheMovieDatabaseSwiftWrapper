@testable import TMDBSwift
import XCTest

final class MovieServiceTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "0"
    }

    func testInit() {
        let movieService = MovieService()

        let actualURLSession = movieService.urlSession

        XCTAssertNotNil(actualURLSession as? URLSession)
    }

    // MARK: - Get Details

    func testDetails() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(Movie.mock))

        let data = try? await MovieService(urlSession: urlSession).details(for: 11)
        XCTAssertNotNil(data)
    }

    func testDetails_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).details(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testFetchDetails_Success() {
        var data: Movie?
        let urlSession = MockURLSession()
        urlSession.result = try! .success(JSONEncoder().encode(Movie.mock))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchDetails(for: 11) { movie in
            data = movie
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testFetchDetails_Failure() {
        var data: Movie? = Movie.mock
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchDetails(for: 11) { movie in
            data = movie
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNil(data)
    }

    // MARK: - Get Alternative Titles

    func testAlternativeTitles() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(AlternativeTitlesResponse.mock))

        let data = try await MovieService(urlSession: urlSession).alternativeTitles(for: 11, country: "anything")
        XCTAssertNotNil(data)
    }

    func testAlternativeTitles_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).alternativeTitles(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testFetchAlternativeTitles_Success() {
        var data: [Title]?
        let urlSession = MockURLSession()
        urlSession.result = try! .success(JSONEncoder().encode(AlternativeTitlesResponse.mock))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchAlternativeTitles(for: 11) { titles in
            data = titles
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testFetchAlternativeTitles_Failure() {
        var data: [Title]? = [Title.mock]
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchAlternativeTitles(for: 11) { titles in
            data = titles
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNil(data)
    }

    // MARK: - Get External IDs

    func testExternalIDs() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(ExternalIDResponse.mock))

        let data = try await MovieService(urlSession: urlSession).externalIDs(for: 11)
        XCTAssertFalse(data.isEmpty)
    }

    func testExternalIDs_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).externalIDs(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testFetchExternalIDs_Success() {
        var data: [ExternalIDType]?
        let urlSession = MockURLSession()
        urlSession.result = try! .success(JSONEncoder().encode(ExternalIDResponse(id: 1, imdb: nil, facebook: nil, instagram: nil, twitter: "12345")))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchExternalIDs(for: 11) { types in
            data = types
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testFetchExternalIDs_Failure() {
        var data: [ExternalIDType]? = [.imdb("123")]
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchExternalIDs(for: 11) { types in
            data = types
            expectation.fulfill()
        }
        waitForExpectations(timeout: expecationTimeout, handler: nil)
        XCTAssertNil(data)
    }
}
