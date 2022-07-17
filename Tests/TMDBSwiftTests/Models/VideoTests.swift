@testable import TMDBSwift
import XCTest

private let data = """
{
    "iso_639_1": "en",
    "iso_3166_1": "US",
    "name": "Star Wars: A New Hope | All the Facts | Disney+ Deets",
    "key": "SCBJJG_Ncl0",
    "site": "YouTube",
    "size": 1080,
    "type": "Featurette",
    "official": true,
    "published_at": "2021-05-03T16:00:12.000Z",
    "id": "62c041a322e4800fa8f138eb"
}
"""

final class VideoTests: XCTestCase {
    func testEncode() throws {
        let video = try JSONDecoder().decode(Video.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(video)
        let decodedVideo = try JSONDecoder().decode(Video.self, from: encodedData)

        XCTAssertEqual(video, decodedVideo)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let video = try jsonDecoder.decode(Video.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(video.countryCode, "US")
        XCTAssertEqual(video.language, .en)
        XCTAssertEqual(video.name, "Star Wars: A New Hope | All the Facts | Disney+ Deets")
        XCTAssertEqual(video.key, "SCBJJG_Ncl0")
        XCTAssertEqual(video.site, "YouTube")
        XCTAssertEqual(video.size, 1080)
        XCTAssertEqual(video.type, "Featurette")
        XCTAssertEqual(video.isOfficial, true)
        XCTAssertEqual(video.publishedDate, Calendar.current.date(from: DateComponents(year: 2021, month: 5, day: 3, hour: 16, minute: 00, second: 12)))
        XCTAssertEqual(video.id, "62c041a322e4800fa8f138eb")

    }
}
