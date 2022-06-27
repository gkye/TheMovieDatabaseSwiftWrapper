import Foundation

/// <#Description#>
public struct Country: Codable {
    /// <#Description#>
    public var countryCode: String // change to enum?
    /// <#Description#>
    public var name: String

    enum CodingKeys: String, CodingKey {
        case countryCode = "iso_3166_1"
        case name
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        countryCode = try container.decode(String.self, forKey: .countryCode)
        name = try container.decode(String.self, forKey: .name)
    }
}
