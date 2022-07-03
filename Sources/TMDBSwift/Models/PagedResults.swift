import Foundation

public struct PagedResults<T: Codable & Equatable>: Codable, Equatable {
    public var page: Int
    public var pageCount: Int
    public var resultCount: Int
    public var results: T

    public init(page: Int,
                pageCount: Int,
                resultCount: Int,
                results: T) {
        self.page = page
        self.pageCount = pageCount
        self.resultCount = resultCount
        self.results = results
    }

    enum CodingKeys: String, CodingKey {
        case page
        case pageCount = "total_pages"
        case resultCount = "total_results"
        case results
    }
}
