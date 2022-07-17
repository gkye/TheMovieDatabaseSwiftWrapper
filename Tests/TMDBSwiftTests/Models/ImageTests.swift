@testable import TMDBSwift
import XCTest

private let data = """
{
    "aspect_ratio": 1.778,
    "height": 1080,
    "iso_639_1": "en",
    "file_path": "/jBFxXKCrViA88hhO59fDx0Av4P.jpg",
    "vote_average": 5.394,
    "vote_count": 10,
    "width": 1920
}
"""

final class ImageTests: XCTestCase {
    func testEncode() throws {
        let image = try JSONDecoder().decode(Image.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(image)
        let decodedImage = try JSONDecoder().decode(Image.self, from: encodedData)

        XCTAssertEqual(image, decodedImage)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let image = try jsonDecoder.decode(Image.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(image.filePath, "/jBFxXKCrViA88hhO59fDx0Av4P.jpg")
        XCTAssertEqual(image.height, 1080)
        XCTAssertEqual(image.language, .en)
        XCTAssertEqual(image.voteAverage, 5.394)
        XCTAssertEqual(image.voteCount, 10)
        XCTAssertEqual(image.width, 1920)
    }
}
