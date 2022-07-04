@testable import TMDBSwift
import XCTest

private let data = """
{
    "name": "User Seven",
    "username": "tmdb-user7",
    "avatar_path": "/https://www.gravatar.com/avatar/96c2e0e4aaad8.jpg",
    "rating": 9.0
}
"""

private let dataEmptyValues = """
{
    "name": "",
    "username": "tmdb-user7",
    "avatar_path": "",
}
"""

final class AuthorTests: XCTestCase {
    func testEncode() throws {
        let author = try JSONDecoder().decode(Author.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(author)
        let decodedAuthor = try JSONDecoder().decode(Author.self, from: encodedData)

        XCTAssertEqual(author, decodedAuthor)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let author = try jsonDecoder.decode(Author.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(author.username, "tmdb-user7")
        XCTAssertEqual(author.name, "User Seven")
        XCTAssertEqual(author.displayName, "User Seven")
        XCTAssertEqual(author.avatarPath, "/https://www.gravatar.com/avatar/96c2e0e4aaad8.jpg")
        XCTAssertEqual(author.rating, 9.0)
    }

    func testEncode_WithEmptyValues() throws {
        let author = try JSONDecoder().decode(Author.self, from: dataEmptyValues.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(author)
        let decodedAuthor = try JSONDecoder().decode(Author.self, from: encodedData)

        XCTAssertEqual(author, decodedAuthor)
    }

    func testDecode_WithEmptyValues() throws {
        let jsonDecoder = JSONDecoder()
        let author = try jsonDecoder.decode(Author.self, from: dataEmptyValues.data(using: .utf8)!)

        XCTAssertEqual(author.username, "tmdb-user7")
        XCTAssertNil(author.name)
        XCTAssertEqual(author.displayName, "tmdb-user7")
        XCTAssertNil(author.avatarPath)
        XCTAssertNil(author.rating)
    }
}
