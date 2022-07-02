import Foundation

/// <#Description#>
public struct Title: Codable, Equatable {
    /// <#Description#>
    public var countryCode: String // change to enum?
    /// <#Description#>
    public var title: String
    /// <#Description#>
    public var type: String?

    enum CodingKeys: String, CodingKey {
        case countryCode = "iso_3166_1"
        case title
        case type
    }

    public init(countyCode: String, title: String, type: String?) {
        self.countryCode = countyCode
        self.title = title
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        countryCode = try container.decode(String.self, forKey: .countryCode)
        title = try container.decode(String.self, forKey: .title)
        if let typeString = try? container.decode(String.self, forKey: .type), typeString != "" {
            type = typeString
        }
    }
}
