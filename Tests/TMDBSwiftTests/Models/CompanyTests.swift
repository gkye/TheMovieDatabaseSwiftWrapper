@testable import TMDBSwift
import XCTest

private let data = """
{
    "id": 1,
    "logo_path": "/o86DbpburjxrqAzEDhXZcyE8pDb.png",
    "name": "Lucasfilm Ltd.",
    "origin_country": "US"
}
"""

final class CompanyTests: XCTestCase {
    func testEncode() throws {
        let company = try JSONDecoder().decode(Company.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(company)
        let decodedCompany = try JSONDecoder().decode(Company.self, from: encodedData)

        XCTAssertEqual(company, decodedCompany)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let company = try jsonDecoder.decode(Company.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(company.id, 1)
        XCTAssertEqual(company.name, "Lucasfilm Ltd.")
        XCTAssertEqual(company.logoPath, "/o86DbpburjxrqAzEDhXZcyE8pDb.png")
        XCTAssertEqual(company.originCountry, "US")
    }
}
