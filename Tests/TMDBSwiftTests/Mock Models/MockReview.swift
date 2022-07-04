@testable import TMDBSwift
import Foundation

extension Review {
    static let mock = Review(reviewID: "60174e821b70ae003c643834", author: Author.mock, content: "A great review!", createdDate: Date(), modifiedDate: nil, urlString: "example.com/image2")
}
