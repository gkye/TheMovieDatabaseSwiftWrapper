import Foundation

/// <#Description#>
public struct Title: Decodable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        countryCode = try container.decode(String.self, forKey: .countryCode)
        title = try container.decode(String.self, forKey: .title)
        type = try? container.decode(String.self, forKey: .type)
    }
}
