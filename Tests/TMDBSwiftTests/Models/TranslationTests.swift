@testable import TMDBSwift
import XCTest

private let data = """
{
    "iso_3166_1": "NL",
    "iso_639_1": "nl",
    "name": "Nederlands",
    "english_name": "Dutch",
    "data": {
        "homepage": "",
        "overview": "Luke Skywalker werkt op het land bij z'n oom en tante op de planeet Tatooine. Als zij door Keizerlijke troepen worden vermoord, sluit Luke zich aan bij de groep rebellen die vecht tegen de tirannie van de Keizer en de slechte Darth Vader. Luke, Princess Leia, Han Solo en de andere rebellen doen een poging de Death Star, het nieuwe wapen van de Keizer, te vernietigen.",
        "runtime": 118,
        "tagline": "",
        "title": "Star Wars: Episode IV - A New Hope"
    }
}
"""

final class TranslationTests: XCTestCase {
    func testEncode() throws {
        let translation = try JSONDecoder().decode(Translation.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(translation)
        let decodedTranslation = try JSONDecoder().decode(Translation.self, from: encodedData)

        XCTAssertEqual(translation, decodedTranslation)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let translation = try jsonDecoder.decode(Translation.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(translation.countryCode, "NL")
        XCTAssertEqual(translation.language.languageCode, "nl")
        XCTAssertEqual(translation.language.name, "Nederlands")
        XCTAssertEqual(translation.language.englishName, "Dutch")
        XCTAssertEqual(translation.content.homepage, "")
        XCTAssertEqual(translation.content.overview, "Luke Skywalker werkt op het land bij z'n oom en tante op de planeet Tatooine. Als zij door Keizerlijke troepen worden vermoord, sluit Luke zich aan bij de groep rebellen die vecht tegen de tirannie van de Keizer en de slechte Darth Vader. Luke, Princess Leia, Han Solo en de andere rebellen doen een poging de Death Star, het nieuwe wapen van de Keizer, te vernietigen.")
        XCTAssertEqual(translation.content.runtime, 118)
        XCTAssertEqual(translation.content.tagline, "")
        XCTAssertEqual(translation.content.title, "Star Wars: Episode IV - A New Hope")
    }
}
