import Foundation

/// <#Description#>
public struct Language: Codable, Equatable {
    /// <#Description#>
    public var languageCode: String // change to enum?
    /// <#Description#>
    public var name: String
    /// <#Description#>
    public var englishName: String?

    public init(languageCode: String,
                name: String,
                englishName: String? = nil) {
        self.languageCode = languageCode
        self.name = name
        self.englishName = englishName
    }

    enum CodingKeys: String, CodingKey {
        case languageCode = "iso_639_1"
        case name
        case englishName = "english_name"
    }
}
