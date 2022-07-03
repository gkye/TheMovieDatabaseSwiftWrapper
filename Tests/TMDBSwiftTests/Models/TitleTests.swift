@testable import TMDBSwift
import XCTest

private let data = """
{
    "iso_3166_1": "US",
    "title": "Star Wars: A New Hope (Episode IV)",
    "type": "Disney+"
}
"""

final class TitleTests: XCTestCase {
    func testEncode() throws {
        let title = try JSONDecoder().decode(Title.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(title)
        let decodedTitle = try JSONDecoder().decode(Title.self, from: encodedData)

        XCTAssertEqual(title, decodedTitle)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let title = try jsonDecoder.decode(Title.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(title.countryCode, "US")
        XCTAssertEqual(title.title, "Star Wars: A New Hope (Episode IV)")
        XCTAssertEqual(title.type, "Disney+")
    }
}
