@testable import TMDBSwift
import XCTest

private let data = """
{
    "page": 1,
    "results": [
        {
            "name": "space marine",
            "id": 1826
        },
        {
            "name": "space travel",
            "id": 3801
        },
        {
            "name": "space invasion",
            "id": 6968
        },
        {
            "name": "space",
            "id": 9882
        },
        {
            "name": "space race",
            "id": 156836
        },
        {
            "name": "space elevator",
            "id": 200413
        },
        {
            "name": "space camp",
            "id": 205349
        },
        {
            "name": "deep space",
            "id": 209280
        },
        {
            "name": "space comedy",
            "id": 221375
        },
        {
            "name": "space capsule",
            "id": 230856
        },
        {
            "name": "space squad",
            "id": 241936
        },
        {
            "name": "head space",
            "id": 243075
        },
        {
            "name": "living space",
            "id": 247462
        },
        {
            "name": "space time",
            "id": 250196
        },
        {
            "name": "space debris",
            "id": 251076
        },
        {
            "name": "space walk",
            "id": 260089
        },
        {
            "name": "space cowboy",
            "id": 272212
        },
        {
            "name": "space ship",
            "id": 290065
        },
        {
            "name": "space guardian",
            "id": 292015
        },
        {
            "name": "space gun",
            "id": 293728
        }
    ],
    "total_pages": 5,
    "total_results": 92
}
"""

final class PagedResultsTests: XCTestCase {
    func testEncode() throws {
        let results = try JSONDecoder().decode(PagedResults<[Keyword]>.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(results)
        let decodedResults = try JSONDecoder().decode(PagedResults<[Keyword]>.self, from: encodedData)

        XCTAssertEqual(results, decodedResults)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let results = try jsonDecoder.decode(PagedResults<[Keyword]>.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(results.page, 1)
        XCTAssertNotNil(results.results)
        XCTAssertEqual(results.pageCount, 5)
        XCTAssertEqual(results.resultCount, 92)
    }
}
