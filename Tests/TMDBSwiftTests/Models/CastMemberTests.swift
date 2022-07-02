@testable import TMDBSwift
import XCTest

private let data = """
{
    "adult": false,
    "gender": 2,
    "id": 2,
    "known_for_department": "Acting",
    "name": "Mark Hamill",
    "original_name": "Mark Hamill",
    "popularity": 35.393,
    "profile_path": "/9Wws35pCsT0KoZpiV4Gk5nbn9ZD.jpg",
    "cast_id": 3,
    "character": "Luke Skywalker",
    "credit_id": "52fe420dc3a36847f8000441",
    "order": 0
}
"""

final class CastMemberTests: XCTestCase {

    func testEncode() throws {
        let castMember = try JSONDecoder().decode(CastMember.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(castMember)
        let decodedCastMember = try JSONDecoder().decode(CastMember.self, from: encodedData)

        XCTAssertEqual(castMember, decodedCastMember)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let castMember = try jsonDecoder.decode(CastMember.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(castMember.id, 2)
        XCTAssertEqual(castMember.adult, false)
        XCTAssertEqual(castMember.castID, 3)
        XCTAssertEqual(castMember.character, "Luke Skywalker")
        XCTAssertEqual(castMember.creditID, "52fe420dc3a36847f8000441")
        XCTAssertEqual(castMember.gender, Gender(rawValue: 2))
        XCTAssertEqual(castMember.knownForDepartment, "Acting")
        XCTAssertEqual(castMember.name, "Mark Hamill")
        XCTAssertEqual(castMember.order, 0)
        XCTAssertEqual(castMember.originalName, "Mark Hamill")
        XCTAssertEqual(castMember.popularity, 35.393)
        XCTAssertEqual(castMember.profilePath, "/9Wws35pCsT0KoZpiV4Gk5nbn9ZD.jpg")
    }
}
