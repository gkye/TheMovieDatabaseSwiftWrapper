@testable import TMDBSwift
import XCTest

// swiftlint:disable type_body_length
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

    func testFetchDetails_Success() throws {
        var data: Movie?
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(Movie.mock))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchDetails(for: 11) { movie in
            data = movie
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
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
        waitForExpectations(timeout: expectationTimeout, handler: nil)
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

    func testFetchAlternativeTitles_Success() throws {
        var data: [Title]?
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(AlternativeTitlesResponse.mock))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchAlternativeTitles(for: 11) { titles in
            data = titles
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
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
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNil(data)
    }

    // MARK: - Get Credits

    func testCredits() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(Credits.mock))

        let data = try await MovieService(urlSession: urlSession).credits(for: 11)
        XCTAssertNotNil(data)
    }

    func testCredits_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).credits(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testFetchCredits_Success() throws {
        var data: Credits?
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(Credits.mock))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchCredits(for: 11) { credits in
            data = credits
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testFetchCredits_Failure() {
        var data: Credits? = Credits.mock
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchCredits(for: 11) { credits in
            data = credits
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
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

    func testFetchExternalIDs_Success() throws {
        var data: [ExternalIDType]?
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(ExternalIDResponse(id: 1, imdb: nil, facebook: nil, instagram: nil, twitter: "12345")))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchExternalIDs(for: 11) { types in
            data = types
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
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
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNil(data)
    }

    // MARK: - Get Images

    func testImages() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(ImageResponse.mock))

        let data = try await MovieService(urlSession: urlSession).images(for: 11, languages: ["en", "null"])
        XCTAssertNotNil(data.0)
        XCTAssertNotNil(data.1)
        XCTAssertNotNil(data.2)
    }

    func testImages_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).images(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testImages_Success() throws {
        var data: ([Image]?, [Image]?, [Image]?)
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(ImageResponse.mock))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchImages(for: 11) { backdrops, logos, posters in
            data = (backdrops, logos, posters)
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNotNil(data.0)
        XCTAssertNotNil(data.1)
        XCTAssertNotNil(data.2)
    }

    func testImages_Failure() {
        var data: ([Image]?, [Image]?, [Image]?) = ([Image.mock], [Image.mock], [Image.mock])
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchImages(for: 11) { backdrops, logos, posters in
            data = (backdrops, logos, posters)
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNil(data.0)
        XCTAssertNil(data.1)
        XCTAssertNil(data.2)
    }

    // MARK: - Get Keywords

    func testKeywords() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(KeywordResponse(id: 1, keywords: [Keyword(name: name, id: 1)])))

        let data = try await MovieService(urlSession: urlSession).keywords(for: 11)
        XCTAssertFalse(data.isEmpty)
    }

    func testKeywords_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).keywords(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testFetchKeywords_Success() throws {
        var data: [Keyword]?
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(KeywordResponse(id: 1, keywords: [Keyword(name: name, id: 1)])))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchKeywords(for: 11) { keywords in
            data = keywords
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testFetchKeywords_Failure() {
        var data: [Keyword]? = [Keyword(name: "name", id: 0)]
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchKeywords(for: 11) { keywords in
            data = keywords
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNil(data)
    }

    // MARK: - Get Lists

    func testLists() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(PagedResults<[List]>(page: 1, pageCount: 10, resultCount: 100, results: [List.mock])))

        let data = try await MovieService(urlSession: urlSession).lists(for: 11, page: 1)
        XCTAssertNotNil(data as PagedResults<[List]>)
    }

    func testLists_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).keywords(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testLists_Success() throws {
        var data: PagedResults<[List]>?
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(PagedResults<[List]>(page: 1, pageCount: 10, resultCount: 100, results: [List.mock])))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchLists(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testLists_Failure() {
        var data: PagedResults<[List]>? = PagedResults<[List]>(page: 1, pageCount: 10, resultCount: 100, results: [List.mock])
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchLists(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNil(data)
    }

    // MARK: - Get Recommendations

    func testRecommendations() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(PagedResults<[Movie]>(page: 1, pageCount: 10, resultCount: 100, results: [Movie.mock])))

        let data = try await MovieService(urlSession: urlSession).recommendations(for: 11, page: 1)
        XCTAssertNotNil(data as PagedResults<[Movie]>)
    }

    func testRecommendations_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).recommendations(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testRecommendations_Success() throws {
        var data: PagedResults<[Movie]>?
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(PagedResults<[Movie]>(page: 1, pageCount: 10, resultCount: 100, results: [Movie.mock])))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchRecommendations(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testRecommendations_Failure() {
        var data: PagedResults<[Movie]>? = PagedResults<[Movie]>(page: 1, pageCount: 10, resultCount: 100, results: [Movie.mock])
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchRecommendations(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNil(data)
    }

    // MARK: - Get Release Dates

    func testReleaseDates() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(
            ResultsResponse<[ReleaseDateResponse]>(id: 11,
                                                   results: [ReleaseDateResponse(countryCode: "US",
                                                                                 releases: [Release.mock])])
        ))

        let data = try await MovieService(urlSession: urlSession).releaseDates(for: 11)
        XCTAssertNotNil(data)
    }

    func testReleaseDates_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).releaseDates(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testReleaseDates_Success() throws {
        var data: [(countryCode: String, releases: [Release])]?
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(
            ResultsResponse<[ReleaseDateResponse]>(id: 11,
                                                   results: [ReleaseDateResponse(countryCode: "US",
                                                                                 releases: [Release.mock])])
        ))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchReleaseDates(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNotNil(data)
    }

    func testReleaseDates_Failure() {
        var data: [(countryCode: String, releases: [Release])]? = [(countryCode: "US", releases: [Release.mock])]
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchReleaseDates(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNil(data)
    }

    // MARK: - Get Reviews

    func testReviews() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(
            PagedResults<[Review]>(page: 1, pageCount: 10, resultCount: 100, results: [Review.mock])
        ))
        let data = try await MovieService(urlSession: urlSession).reviews(for: 11, page: 1)
        XCTAssertNotNil(data)
        XCTAssertEqual(data.results.count, 1)
    }

    func testReviews_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).reviews(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testReviews_Success() throws {
        var data: PagedResults<[Review]>?
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(
            PagedResults<[Review]>(page: 1, pageCount: 10, resultCount: 100, results: [Review.mock])
        ))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchReviews(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNotNil(data)
        XCTAssertEqual(data?.results.count, 1)
    }

    func testReviews_Failure() {
        var data: PagedResults<[Review]>? = PagedResults<[Review]>(page: 1, pageCount: 10, resultCount: 100, results: [Review.mock])

        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchReviews(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNil(data)
    }

    // MARK: - Get Similar Movies

    func testSimilarMovies() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(
            PagedResults<[Movie]>(page: 1, pageCount: 10, resultCount: 100, results: [Movie.mock])
        ))
        let data = try await MovieService(urlSession: urlSession).similarMovies(for: 11, page: 1)
        XCTAssertNotNil(data)
        XCTAssertEqual(data.results.count, 1)
    }

    func testSimilarMovies_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).similarMovies(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testSimilarMovies_Success() throws {
        var data: PagedResults<[Movie]>?
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(
            PagedResults<[Movie]>(page: 1, pageCount: 10, resultCount: 100, results: [Movie.mock])
        ))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchSimilarMovies(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNotNil(data)
        XCTAssertEqual(data?.results.count, 1)
    }

    func testSimilarMovies_Failure() {
        var data: PagedResults<[Movie]>? = PagedResults<[Movie]>(page: 1, pageCount: 10, resultCount: 100, results: [Movie.mock])

        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchSimilarMovies(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNil(data)
    }

    // MARK: - Get Translations

    func testTranslations() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(TranslationsResponse(id: 1, translations: [Translation.mock])))

        let data = try await MovieService(urlSession: urlSession).translations(for: 11)
        XCTAssertNotNil(data)
        XCTAssertEqual(data.count, 1)
    }

    func testTranslations_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).translations(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testTranslations_Success() throws {
        var data: [TMDBSwift.Translation]?
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(TranslationsResponse(id: 1, translations: [Translation.mock])))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchTranslations(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNotNil(data)
        XCTAssertEqual(data?.count, 1)
    }

    func testTranslations_Failure() {
        var data: [TMDBSwift.Translation]? = [Translation.mock]

        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchTranslations(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNil(data)
    }

    // MARK: - Get Videos

    func testVideos() async throws {
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(ResultsResponse(id: 1, results: [Video.mock])))

        let data = try await MovieService(urlSession: urlSession).videos(for: 11)
        XCTAssertNotNil(data)
        XCTAssertEqual(data.count, 1)
    }

    func testVideos_InvalidAPIKey() async throws {
        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        TMDBConfig.apikey = nil

        do {
            _ = try await MovieService(urlSession: urlSession).videos(for: 11)
            XCTFail("Function should have thrown by now")
        } catch let error as TMDBError {
            XCTAssertEqual(error, TMDBError.invalidAPIKey)
        }
    }

    func testVideos_Success() throws {
        var data: [Video]?
        let urlSession = MockURLSession()
        urlSession.result = try .success(JSONEncoder().encode(ResultsResponse(id: 1, results: [Video.mock])))

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchVideos(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNotNil(data)
        XCTAssertEqual(data?.count, 1)
    }

    func testVideos_Failure() {
        var data: [Video]? = [Video.mock]

        let urlSession = MockURLSession()
        urlSession.result = .failure(NSError())

        let expectation = self.expectation(description: "Wait for data to load.")

        MovieService(urlSession: urlSession).fetchVideos(for: 11) { results in
            data = results
            expectation.fulfill()
        }
        waitForExpectations(timeout: expectationTimeout, handler: nil)
        XCTAssertNil(data)
    }
}
