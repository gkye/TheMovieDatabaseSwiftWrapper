@testable import TMDBSwift
import XCTest

private let data = """
{
    "iso_3166_1": "US",
    "name": "United States of America"
}
"""

final class CountryTests: XCTestCase {

    func testEncode() throws {
        let country = try JSONDecoder().decode(Country.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(country)
        let decodedCountry = try JSONDecoder().decode(Country.self, from: encodedData)

        XCTAssertEqual(country, decodedCountry)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let country = try jsonDecoder.decode(Country.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(country.countryCode, "US")
        XCTAssertEqual(country.name, "United States of America")
    }
}
