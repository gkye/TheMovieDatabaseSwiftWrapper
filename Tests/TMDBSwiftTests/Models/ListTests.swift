@testable import TMDBSwift
import XCTest

private let data = """
{
    "description": "All movies and shows I've seen",
    "favorite_count": 0,
    "id": 7111094,
    "item_count": 2569,
    "iso_639_1": "en",
    "list_type": "movie",
    "name": "Movies I've seen",
    "poster_path": "/jBFxXKCrViA88hhO59fDx0Av4P.jpg"
}
"""

final class ListTests: XCTestCase {
    func testEncode() throws {
        let list = try JSONDecoder().decode(List.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(list)
        let decodedList = try JSONDecoder().decode(List.self, from: encodedData)

        XCTAssertEqual(list, decodedList)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let list = try jsonDecoder.decode(List.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(list.id, 7111094)
        XCTAssertEqual(list.description, "All movies and shows I've seen")
        XCTAssertEqual(list.favoriteCount, 0)
        XCTAssertEqual(list.itemCount, 2569)
        XCTAssertEqual(list.languageCode, "en")
        XCTAssertEqual(list.name, "Movies I've seen")
        XCTAssertEqual(list.posterPath, "/jBFxXKCrViA88hhO59fDx0Av4P.jpg")
    }
}
