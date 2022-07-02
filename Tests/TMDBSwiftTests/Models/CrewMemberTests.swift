@testable import TMDBSwift
import XCTest

private let data = """
{
    "adult": false,
    "gender": 2,
    "id": 491,
    "known_for_department": "Sound",
    "name": "John Williams",
    "original_name": "John Williams",
    "popularity": 1.949,
    "profile_path": "/KFyMqUWeiBdP9tJcZyGWOqnrgK.jpg",
    "credit_id": "52fe420dc3a36847f800046d",
    "department": "Sound",
    "job": "Original Music Composer"
}
"""

final class CrewMemberTests: XCTestCase {

    func testEncode() throws {
        let crewMember = try JSONDecoder().decode(CrewMember.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(crewMember)
        let decodedCrewMember = try JSONDecoder().decode(CrewMember.self, from: encodedData)

        XCTAssertEqual(crewMember, decodedCrewMember)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let crewMember = try jsonDecoder.decode(CrewMember.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(crewMember.id, 491)
        XCTAssertEqual(crewMember.adult, false)
        XCTAssertEqual(crewMember.creditID, "52fe420dc3a36847f800046d")
        XCTAssertEqual(crewMember.department, "Sound")
        XCTAssertEqual(crewMember.gender, Gender(rawValue: 2))
        XCTAssertEqual(crewMember.knownForDepartment, "Sound")
        XCTAssertEqual(crewMember.name, "John Williams")
        XCTAssertEqual(crewMember.originalName, "John Williams")
        XCTAssertEqual(crewMember.job, "Original Music Composer")
        XCTAssertEqual(crewMember.popularity, 1.949)
        XCTAssertEqual(crewMember.profilePath, "/KFyMqUWeiBdP9tJcZyGWOqnrgK.jpg")
    }
}
