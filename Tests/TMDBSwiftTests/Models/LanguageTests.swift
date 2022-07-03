@testable import TMDBSwift
import XCTest

private let data = """
{
    "english_name": "English",
    "iso_639_1": "en",
    "name": "English"
}
"""

final class LanguageTests: XCTestCase {
    func testEncode() throws {
        let language = try JSONDecoder().decode(Language.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(language)
        let decodedLanguage = try JSONDecoder().decode(Language.self, from: encodedData)

        XCTAssertEqual(language, decodedLanguage)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let language = try jsonDecoder.decode(Language.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(language.name, "English")
        XCTAssertEqual(language.languageCode, "en")
        XCTAssertEqual(language.englishName, "English")
    }
}
