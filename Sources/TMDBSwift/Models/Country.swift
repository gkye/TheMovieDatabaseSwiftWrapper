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
}
