import Foundation

/// <#Description#>
public struct TVSeries: Decodable {
    /// <#Description#>
    public var id: Int
    /// <#Description#>
    public var backdropPath: String?

//    public var epidsodeRunTimes: [Int]?

//    public var firstAirDate: Date?

    /// <#Description#>
    public var genres: [Genre]?
    /// <#Description#>
    public var homepage: String?

//    public var isInProduction: Bool?

    /// <#Description#>
    public var originalLanguage: SupportedLanguage?
    /// <#Description#>
    public var overview: String?
    /// <#Description#>
    public var popularity: Double?
    /// <#Description#>
    public var posterPath: String?
    /// <#Description#>
    public var productionCompanies: [Company]?
    /// <#Description#>
    public var productionCountries: [Country]?
    /// <#Description#>
    public var spokenLanguages: [SupportedLanguage]?
    /// <#Description#>
    public var status: String? // change to enum?
    /// <#Description#>
    public var tagline: String?
    /// <#Description#>
    public var voteAverage: Double?
    /// <#Description#>
    public var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case backdropPath = "backdrop_path"
        case budget
        case collection = "belongs_to_collection"
        case genres
        case homepage
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountires = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

    enum SpokenLanguageCodingKeys: String, CodingKey {
        case language = "iso_639_1"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        backdropPath = try? container.decode(String.self, forKey: .backdropPath)
        genres = try? container.decode([Genre].self, forKey: .genres)
        homepage = try? container.decode(String.self, forKey: .homepage)
        originalLanguage = try? container.decode(SupportedLanguage.self, forKey: .originalLanguage)
        overview = try? container.decode(String.self, forKey: .overview)
        popularity = try? container.decode(Double.self, forKey: .popularity)
        posterPath = try? container.decode(String.self, forKey: .posterPath)
        productionCompanies = try? container.decode([Company].self, forKey: .productionCompanies)
        productionCountries = try? container.decode([Country].self, forKey: .productionCountires)
        if var content = try? container.nestedUnkeyedContainer(forKey: .spokenLanguages) {
            var languages: [SupportedLanguage] = []

            while !content.isAtEnd {
                if let language = try? content.nestedContainer(keyedBy: SpokenLanguageCodingKeys.self) {
                    if let supportedLanguage = try? language.decode(SupportedLanguage.self, forKey: .language) {
                        languages.append(supportedLanguage)
                    }
                } else {
                    break
                }
            }
            spokenLanguages = languages
        }
        status = try? container.decode(String.self, forKey: .status)
        tagline = try? container.decode(String.self, forKey: .tagline)
        voteAverage = try? container.decode(Double.self, forKey: .voteAverage)
        voteCount = try? container.decode(Int.self, forKey: .voteCount)
    }
}
