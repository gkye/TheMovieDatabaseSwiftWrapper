@testable import TMDBSwift
import XCTest

private let data = """
{
    "author": "r96sk",
    "author_details": {
        "name": "",
        "username": "r96sk",
        "avatar_path": "/https://www.gravatar.com/avatar/96c2e0e4ac98450f9e8e3c0a0a40aad8.jpg",
        "rating": 9.0
    },
    "content": "A quality start to the franchise.\\r\\n\\r\\nI say start, I guess that depends on the (seemingly) controversial way of watching these films - I\'ve decided on release order, so it\'s the beginning for me anyway. I\'ve heard a lot about <em>\'Star Wars\'</em> so I am expecting big things, this didn\'t disappoint whatsoever.\\r\\n\\r\\nI unquestionably enjoyed this! If I didn\'t know this was released in 1977 I would never have guessed, it still holds up astonishingly well. The special effects are spectacular for the vast, vast majority; even the stuff that perhaps hasn\'t aged as supremely still looks superb.\\r\\n\\r\\nThe cast are a joy. I actually wouldn\'t say any performance sensationally stood out, but all the actors and all the characters are so much fun to watch together. Mark Hamill is impressive as Luke, Harrison Ford is entertaining as Han and Carrie Fisher is super as Leia. Credit also to James Earl Jones and Alec Guinness, among others. Despite not watching until now, I literally already knew all of the character names - shows how timeless these are.\\r\\n\\r\\nThe plot makes for top notch viewing, I found the pacing to be particularly spot on. And how about that score? Stupendous! I really have no negatives for this, I\'m sure it isn\'t perfect but I had a very fun time with it.\",
    "created_at": "2021-02-01T00:42:42.135Z",
    "id": "60174e821b70ae003c643834",
    "updated_at": "2021-06-23T15:58:50.959Z",
    "url": "https://www.themoviedb.org/review/60174e821b70ae003c643834"
}
"""

private let badData = """
{
    "author": "r96sk",
    "author_details": {
        "name": "",
        "username": "r96sk",
        "avatar_path": "/https://www.gravatar.com/avatar/96c2e0e4ac98450f9e8e3c0a0a40aad8.jpg",
        "rating": 9.0
    },
    "content": "A quality start to the franchise.\\r\\n\\r\\nI say start, I guess that depends on the (seemingly) controversial way of watching these films - I\'ve decided on release order, so it\'s the beginning for me anyway. I\'ve heard a lot about <em>\'Star Wars\'</em> so I am expecting big things, this didn\'t disappoint whatsoever.\\r\\n\\r\\nI unquestionably enjoyed this! If I didn\'t know this was released in 1977 I would never have guessed, it still holds up astonishingly well. The special effects are spectacular for the vast, vast majority; even the stuff that perhaps hasn\'t aged as supremely still looks superb.\\r\\n\\r\\nThe cast are a joy. I actually wouldn\'t say any performance sensationally stood out, but all the actors and all the characters are so much fun to watch together. Mark Hamill is impressive as Luke, Harrison Ford is entertaining as Han and Carrie Fisher is super as Leia. Credit also to James Earl Jones and Alec Guinness, among others. Despite not watching until now, I literally already knew all of the character names - shows how timeless these are.\\r\\n\\r\\nThe plot makes for top notch viewing, I found the pacing to be particularly spot on. And how about that score? Stupendous! I really have no negatives for this, I\'m sure it isn\'t perfect but I had a very fun time with it.\",
    "created_at": "2021-02-01",
    "id": "60174e821b70ae003c643834",
    "updated_at": "2021-06-23T15:58:50.959Z",
    "url": "https://www.themoviedb.org/review/60174e821b70ae003c643834"
}
"""

final class ReviewTests: XCTestCase {
    func testEncode() throws {
        let review = try JSONDecoder().decode(Review.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(review)
        let decodedReview = try JSONDecoder().decode(Review.self, from: encodedData)

        XCTAssertEqual(review, decodedReview)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let review = try jsonDecoder.decode(Review.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(review.reviewID, "60174e821b70ae003c643834")
        XCTAssertEqual(review.author, Author(username: "r96sk", name: nil, avatarPath: "/https://www.gravatar.com/avatar/96c2e0e4ac98450f9e8e3c0a0a40aad8.jpg", rating: 9.0))
        XCTAssertEqual(review.content, "A quality start to the franchise.\r\n\r\nI say start, I guess that depends on the (seemingly) controversial way of watching these films - I've decided on release order, so it's the beginning for me anyway. I've heard a lot about <em>'Star Wars'</em> so I am expecting big things, this didn't disappoint whatsoever.\r\n\r\nI unquestionably enjoyed this! If I didn't know this was released in 1977 I would never have guessed, it still holds up astonishingly well. The special effects are spectacular for the vast, vast majority; even the stuff that perhaps hasn't aged as supremely still looks superb.\r\n\r\nThe cast are a joy. I actually wouldn't say any performance sensationally stood out, but all the actors and all the characters are so much fun to watch together. Mark Hamill is impressive as Luke, Harrison Ford is entertaining as Han and Carrie Fisher is super as Leia. Credit also to James Earl Jones and Alec Guinness, among others. Despite not watching until now, I literally already knew all of the character names - shows how timeless these are.\r\n\r\nThe plot makes for top notch viewing, I found the pacing to be particularly spot on. And how about that score? Stupendous! I really have no negatives for this, I'm sure it isn't perfect but I had a very fun time with it.")
        XCTAssertEqual(review.urlString, "https://www.themoviedb.org/review/60174e821b70ae003c643834")
        XCTAssertEqual(review.createdDate, Calendar.current.date(from: DateComponents(year: 2021, month: 2, day: 1, hour: 0, minute: 42, second: 42, nanosecond: 135000000)))
        XCTAssertEqual(review.modifiedDate, Calendar.current.date(from: DateComponents(year: 2021, month: 6, day: 23, hour: 15, minute: 58, second: 50, nanosecond: 959000100)))

    }

    func testDecode_BadDateFormat() throws {
        let jsonDecoder = JSONDecoder()
        XCTAssertThrowsError(try jsonDecoder.decode(Review.self, from: badData.data(using: .utf8)!))
    }
}
