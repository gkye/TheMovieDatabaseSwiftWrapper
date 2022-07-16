import Foundation

/// <#Description#>
public struct Translation: Codable, Equatable {

    /// <#Description#>
    public struct Content: Codable, Equatable {
        /// An external website's path.
        ///
        /// This is not necessarily a The Movie Database website.
        public var homepage: String?
        /// The overview.
        public var overview: String
        /// The runtime in minutes.
        public var runtime: Int?
        /// The tagline.
        public var tagline: String?
        /// The title.
        public var title: String

        public init(homepage: String? = nil, overview: String, runtime: Int? = nil, tagline: String? = nil, title: String) {
            self.homepage = homepage
            self.overview = overview
            self.runtime = runtime
            self.tagline = tagline
            self.title = title
        }

        public enum CodingKeys: CodingKey {
            case homepage
            case overview
            case runtime
            case tagline
            case title
        }
    }

    /// <#Description#>
    public var countryCode: String // change to enum?
    /// <#Description#>
    public var language: Language
    /// <#Description#>
    public var content: Content

    public init(countryCode: String, language: Language, content: Translation.Content) {
        self.countryCode = countryCode
        self.language = language
        self.content = content
    }

    public enum CodingKeys: String, CodingKey {
        case countryCode = "iso_3166_1"
        case language
        case languageCode = "iso_639_1"
        case name
        case englishName = "english_name"
        case content = "data"
        case homepage
        case overview
        case runtime
        case tagline
        case title
    }

    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Translation.CodingKeys> = try decoder.container(keyedBy: Translation.CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: Translation.CodingKeys.self,
                                                 forKey: .content)

        self.countryCode = try container.decode(String.self, forKey: Translation.CodingKeys.countryCode)
        self.language = Language(
            languageCode: try container.decode(String.self, forKey: Translation.CodingKeys.languageCode),
            name: try container.decode(String.self, forKey: Translation.CodingKeys.name),
            englishName: try container.decode(String.self, forKey: Translation.CodingKeys.englishName))

        self.content = Content(homepage: try data.decode(String.self, forKey: Translation.CodingKeys.homepage),
                               overview: try data.decode(String.self, forKey: Translation.CodingKeys.overview),
                               runtime: try data.decode(Int.self, forKey: Translation.CodingKeys.runtime),
                               tagline: try data.decode(String.self, forKey: Translation.CodingKeys.tagline),
                               title: try data.decode(String.self, forKey: Translation.CodingKeys.title))

    }

    public func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<Translation.CodingKeys> = encoder.container(keyedBy: Translation.CodingKeys.self)

        try container.encode(self.countryCode, forKey: Translation.CodingKeys.countryCode)
        try container.encode(self.language.languageCode, forKey: .languageCode)
        try container.encode(self.language.englishName, forKey: .englishName)
        try container.encode(self.language.name, forKey: .name)

        var content = container.nestedContainer(keyedBy: Translation.Content.CodingKeys.self, forKey: .content)
        try content.encode(self.content.homepage, forKey: .homepage)
        try content.encode(self.content.overview, forKey: .overview)
        try content.encode(self.content.runtime, forKey: .runtime)
        try content.encode(self.content.tagline, forKey: .tagline)
        try content.encode(self.content.title, forKey: .title)
    }
}
