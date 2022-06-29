import Foundation

/// <#Description#>
public struct Company: Codable {
    /// <#Description#>
    public var id: Int
    /// <#Description#>
    public var logoPath: String?
    /// <#Description#>
    public var name: String?
    /// <#Description#>
    public var originCountry: String? // change to enum?

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}
