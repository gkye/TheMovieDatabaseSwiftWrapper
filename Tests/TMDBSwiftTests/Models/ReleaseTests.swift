@testable import TMDBSwift
import XCTest

private let data = """
{
    "certification": "PG",
    "iso_639_1": "en",
    "note": "IMAX",
    "release_date": "1997-06-17T00:00:00.000Z",
    "type": 3
}
"""

private let dataEmptyValues = """
{
    "certification": "",
    "iso_639_1": "",
    "note": "",
    "release_date": "1997-06-17T00:00:00.000Z",
    "type": 3
}
"""

private let badData = """
{
    "certification": "",
    "iso_639_1": "",
    "note": "",
    "release_date": "1997-06-17",
    "type": 3
}
"""

final class ReleaseTests: XCTestCase {
    func testEncode() throws {
        let release = try JSONDecoder().decode(Release.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(release)
        let decodedRelease = try JSONDecoder().decode(Release.self, from: encodedData)

        XCTAssertEqual(release, decodedRelease)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let release = try jsonDecoder.decode(Release.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(release.releaseDate, Calendar.current.date(from: DateComponents(year: 1997, month: 6, day: 17)))
        XCTAssertEqual(release.type, .theatrical)
        XCTAssertEqual(release.certification, "PG")
        XCTAssertEqual(release.note, "IMAX")
        XCTAssertEqual(release.language, .en)
    }

    func testEncode_EmptyValues() throws {
        let release = try JSONDecoder().decode(Release.self, from: dataEmptyValues.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(release)
        let decodedRelease = try JSONDecoder().decode(Release.self, from: encodedData)

        XCTAssertEqual(release, decodedRelease)
    }

    func testDecode_EmptyValues() throws {
        let jsonDecoder = JSONDecoder()
        let release = try jsonDecoder.decode(Release.self, from: dataEmptyValues.data(using: .utf8)!)

        XCTAssertEqual(release.releaseDate, Calendar.current.date(from: DateComponents(year: 1997, month: 6, day: 17)))
        XCTAssertEqual(release.type, .theatrical)
        XCTAssertNil(release.certification)
        XCTAssertNil(release.note)
        XCTAssertNil(release.language)
    }

    func testDecode_BadDateFormat() throws {
        let jsonDecoder = JSONDecoder()
        XCTAssertThrowsError(try jsonDecoder.decode(Release.self, from: badData.data(using: .utf8)!))
    }
}
