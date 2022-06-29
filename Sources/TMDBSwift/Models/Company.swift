import Foundation

/// <#Description#>
public struct Company: Codable, Equatable {
    /// <#Description#>
    public var id: Int
    /// <#Description#>
    public var logoPath: String?
    /// <#Description#>
    public var name: String?
    /// <#Description#>
    public var originCountry: String? // change to enum?

    public init(id: Int,
                logoPath: String? = nil,
                name: String? = nil,
                originCountry: String? = nil) {
        self.id = id
        self.logoPath = logoPath
        self.name = name
        self.originCountry = originCountry
    }

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        logoPath = try? container.decode(String.self, forKey: .logoPath)
        name = try? container.decode(String.self, forKey: .name)
        originCountry = try? container.decode(String.self, forKey: .originCountry)
    }
}
