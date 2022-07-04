import Foundation

/// <#Description#>
public struct Review: Codable, Equatable {
    /// <#Description#>
    public var reviewID: String
    /// <#Description#>
    public var author: Author
    /// <#Description#>
    public var content: String
    /// <#Description#>
    public var createdDate: Date
    /// <#Description#>
    public var modifiedDate: Date?
    /// <#Description#>
    public var urlString: String

    public init(reviewID: String,
                author: Author,
                content: String,
                createdDate: Date,
                modifiedDate: Date? = nil,
                urlString: String) {
        self.reviewID = reviewID
        self.author = author
        self.content = content
        self.createdDate = createdDate
        self.modifiedDate = modifiedDate
        self.urlString = urlString
    }

    enum CodingKeys: String, CodingKey {
        case reviewID = "id"
        case author = "author_details"
        case content
        case createdDate = "created_at"
        case modifiedDate = "updated_at"
        case urlString = "url"
    }

    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Review.CodingKeys> = try decoder.container(keyedBy: Review.CodingKeys.self)

        self.reviewID = try container.decode(String.self, forKey: Review.CodingKeys.reviewID)
        self.author = try container.decode(Author.self, forKey: Review.CodingKeys.author)
        self.content = try container.decode(String.self, forKey: Review.CodingKeys.content)
        self.urlString = try container.decode(String.self, forKey: Review.CodingKeys.urlString)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let createdDateString = try? container.decode(String.self, forKey: .createdDate), let createdDate = dateFormatter.date(from: createdDateString) {
            self.createdDate = createdDate
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [Release.CodingKeys.releaseDate], debugDescription: "Cannot parse date"))
        }

        if let modifiedDateString = try? container.decode(String.self, forKey: .modifiedDate), let modifiedDate = dateFormatter.date(from: modifiedDateString) {
            self.modifiedDate = modifiedDate
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Review.CodingKeys.self)

        try container.encode(self.reviewID, forKey: Review.CodingKeys.reviewID)
        try container.encode(self.author, forKey: Review.CodingKeys.author)
        try container.encode(self.content, forKey: Review.CodingKeys.content)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        try container.encode(dateFormatter.string(from: self.createdDate), forKey: Review.CodingKeys.createdDate)
        if let modifiedDate = self.modifiedDate {
            try container.encodeIfPresent(dateFormatter.string(from: modifiedDate), forKey: Review.CodingKeys.modifiedDate)
        }
        try container.encode(self.urlString, forKey: Review.CodingKeys.urlString)
    }
}
