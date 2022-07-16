import Foundation

/// <#Description#>
public struct Video: Codable, Equatable {

    /// <#Description#>
    public var id: String
    /// <#Description#>
    public var countryCode: String?
    /// <#Description#>
    public var languageCode: String?
    /// <#Description#>
    public var key: String?
    /// <#Description#>
    public var name: String?
    /// <#Description#>
    public var site: String?
    /// <#Description#>
    public var size: Int?
    /// <#Description#>
    public var type: String?
    /// <#Description#>
    public var isOfficial: Bool = false
    /// <#Description#>
    public var publishedDate: Date?

    public init(id: String, countryCode: String? = nil, languageCode: String? = nil, key: String? = nil, name: String? = nil, site: String? = nil, size: Int? = nil, type: String? = nil, isOfficial: Bool = false, publishedDate: Date? = nil) {
        self.id = id
        self.countryCode = countryCode
        self.languageCode = languageCode
        self.key = key
        self.name = name
        self.site = site
        self.size = size
        self.type = type
        self.isOfficial = isOfficial
        self.publishedDate = publishedDate
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case countryCode = "iso_3166_1"
        case languageCode = "iso_639_1"
        case key
        case name
        case site
        case size
        case type
        case isOfficial = "official"
        case publishedDate = "published_at"
    }

    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Video.CodingKeys> = try decoder.container(keyedBy: Video.CodingKeys.self)

        self.id = try container.decode(String.self, forKey: Video.CodingKeys.id)
        self.countryCode = try container.decode(String.self, forKey: Video.CodingKeys.countryCode)
        self.languageCode = try container.decode(String.self, forKey: Video.CodingKeys.languageCode)
        self.key = try container.decode(String.self, forKey: Video.CodingKeys.key)
        self.name = try container.decode(String.self, forKey: Video.CodingKeys.name)
        self.site = try container.decode(String.self, forKey: Video.CodingKeys.site)
        self.size = try container.decode(Int.self, forKey: Video.CodingKeys.size)
        self.type = try container.decode(String.self, forKey: Video.CodingKeys.type)
        self.isOfficial = try container.decode(Bool.self, forKey: Video.CodingKeys.isOfficial)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let publishedDateString = try? container.decode(String.self, forKey: .publishedDate), let publishedDate = dateFormatter.date(from: publishedDateString) {
            self.publishedDate = publishedDate
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<Video.CodingKeys> = encoder.container(keyedBy: Video.CodingKeys.self)

        try container.encode(self.id, forKey: Video.CodingKeys.id)
        try container.encode(self.countryCode, forKey: Video.CodingKeys.countryCode)
        try container.encode(self.languageCode, forKey: Video.CodingKeys.languageCode)
        try container.encode(self.key, forKey: Video.CodingKeys.key)
        try container.encode(self.name, forKey: Video.CodingKeys.name)
        try container.encode(self.site, forKey: Video.CodingKeys.site)
        try container.encode(self.size, forKey: Video.CodingKeys.size)
        try container.encode(self.type, forKey: Video.CodingKeys.type)
        try container.encode(self.isOfficial, forKey: Video.CodingKeys.isOfficial)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let publishedDate = self.publishedDate {
            try container.encodeIfPresent(dateFormatter.string(from: publishedDate), forKey: Video.CodingKeys.publishedDate)
        }
    }
}
