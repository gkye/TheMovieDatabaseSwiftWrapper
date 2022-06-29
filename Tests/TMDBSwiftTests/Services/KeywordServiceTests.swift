@testable import TMDBSwift
import XCTest

final class KeywordServiceTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TMDBConfig.apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
    }

    func testKeywordQuery() async throws {
        let data = try await KeywordService.shared.keywords(for: "rom")
        XCTAssertNotNil(data)
    }

    func testTVKeywords() async throws {
        let data = try await KeywordService.shared.keywords(tvID: 92830)
        XCTAssertNotNil(data)
    }

    func testKeywordDetail() async throws {
        let data = try await KeywordService.shared.keyword(for: 10562)
        XCTAssertNotNil(data)
    }
}
