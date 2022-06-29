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
}
