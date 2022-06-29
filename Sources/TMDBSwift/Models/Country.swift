import Foundation

/// <#Description#>
public struct Country: Codable, Equatable {
    /// <#Description#>
    public var countryCode: String // change to enum?
    /// <#Description#>
    public var name: String

    public init(countryCode: String, name: String) {
        self.countryCode = countryCode
        self.name = name
    }

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
