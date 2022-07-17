import Foundation

/// <#Description#>
public struct Release: Codable, Equatable {
    /// <#Description#>
    public var certification: String?
    /// <#Description#>
    public var language: Language?
    /// <#Description#>
    public var note: String?
    /// <#Description#>
    public var releaseDate: Date
    /// <#Description#>
    public var type: ReleaseType

    public init(certification: String? = nil,
                language: Language? = nil,
                note: String? = nil,
                releaseDate: Date,
                type: ReleaseType) {
        self.certification = certification
        self.language = language
        self.note = note
        self.releaseDate = releaseDate
        self.type = type
    }

    enum CodingKeys: String, CodingKey {
        case certification
        case language = "iso_639_1"
        case note
        case releaseDate = "release_date"
        case type
    }

    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Release.CodingKeys> = try decoder.container(keyedBy: Release.CodingKeys.self)

        if let certificationString = try? container.decodeIfPresent(String.self, forKey: Release.CodingKeys.certification), certificationString != "" {
            certification = certificationString
        }
        if let languageString = try? container.decodeIfPresent(Language.self, forKey: Release.CodingKeys.language) {
            language = languageString
        }
        if let noteString = try? container.decodeIfPresent(String.self, forKey: Release.CodingKeys.note), noteString != "" {
            note = noteString
        }
        self.type = try container.decode(ReleaseType.self, forKey: Release.CodingKeys.type)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let dateString = try? container.decode(String.self, forKey: .releaseDate), let releaseDate = dateFormatter.date(from: dateString) {
            self.releaseDate = releaseDate
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [Release.CodingKeys.releaseDate], debugDescription: "Cannot parse date"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<Release.CodingKeys> = encoder.container(keyedBy: Release.CodingKeys.self)

        try container.encodeIfPresent(self.certification, forKey: Release.CodingKeys.certification)
        try container.encodeIfPresent(self.language, forKey: Release.CodingKeys.language)
        try container.encodeIfPresent(self.note, forKey: Release.CodingKeys.note)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        try container.encode(dateFormatter.string(from: releaseDate), forKey: .releaseDate)
        try container.encodeIfPresent(self.type, forKey: Release.CodingKeys.type)
    }
}
