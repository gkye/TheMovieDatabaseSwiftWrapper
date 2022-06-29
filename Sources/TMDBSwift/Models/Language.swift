import Foundation

/// <#Description#>
public struct Language: Codable, Equatable {
    /// <#Description#>
    public var languageCode: String // change to enum?
    /// <#Description#>
    public var name: String

    public init(languageCode: String, name: String) {
        self.languageCode = languageCode
        self.name = name
    }

    enum CodingKeys: String, CodingKey {
        case languageCode = "iso_639_1"
        case name
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        languageCode = try container.decode(String.self, forKey: .languageCode)
        name = try container.decode(String.self, forKey: .name)
    }
}
