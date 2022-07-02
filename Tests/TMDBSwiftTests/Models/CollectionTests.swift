@testable import TMDBSwift
import XCTest

private let data = """
{
    "id": 10,
    "name": "Star Wars Collection",
    "poster_path": "/bYbHqvRANCpuRTs0RAu10LhmVKU.jpg",
    "backdrop_path": "/d8duYyyC9J5T825Hg7grmaabfxQ.jpg"
}
"""

final class CollectionTests: XCTestCase {

    func testEncode() throws {
        let collection = try JSONDecoder().decode(Collection.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(collection)
        let decodedCollection = try JSONDecoder().decode(Collection.self, from: encodedData)

        XCTAssertEqual(collection, decodedCollection)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let collection = try jsonDecoder.decode(Collection.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(collection.id, 10)
        XCTAssertEqual(collection.name, "Star Wars Collection")
        XCTAssertEqual(collection.backdropPath, "/d8duYyyC9J5T825Hg7grmaabfxQ.jpg")
        XCTAssertEqual(collection.posterPath, "/bYbHqvRANCpuRTs0RAu10LhmVKU.jpg")
    }
}
