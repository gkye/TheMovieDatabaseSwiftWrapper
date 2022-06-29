import Foundation

/// <#Description#>
public struct Language: Codable {
    /// <#Description#>
    public var languageCode: String // change to enum?
    /// <#Description#>
    public var name: String

    enum CodingKeys: String, CodingKey {
        case languageCode = "iso_639_1"
        case name
    }
}
