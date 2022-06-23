import Foundation

/// <#Description#>
public struct Movie: Decodable {
    /// <#Description#>
    public var id: Int
    /// <#Description#>
    public var adult: Bool?
    /// <#Description#>
    public var backdropPath: String?
    /// <#Description#>
    public var budget: Int?
    /// <#Description#>
    public var collection: Collection?
    /// <#Description#>
    public var genres: [Genre]?
    /// <#Description#>
    public var homepage: String?
    /// <#Description#>
    public var imdbID: String?
    /// <#Description#>
    public var originalLanguage: String? // change to enum?
    /// <#Description#>
    public var originalTitle: String?
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
    public var releaseDate: Date?
    /// <#Description#>
    public var revenue: Int?
    /// <#Description#>
    public var runtime: Int?
    /// <#Description#>
    public var spokenLanguages: [Language]? // simplify to array of language types?
    /// <#Description#>
    public var status: String? // change to enum?
    /// <#Description#>
    public var tagline: String?
    /// <#Description#>
    public var title: String?
    /// <#Description#>
    public var video: Bool?
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        adult = try? container.decode(Bool.self, forKey: .adult)
        backdropPath = try? container.decode(String.self, forKey: .backdropPath)
        budget = try? container.decode(Int.self, forKey: .budget)
        collection = try? container.decode(Collection.self, forKey: .collection)
        genres = try? container.decode([Genre].self, forKey: .genres)
        homepage = try? container.decode(String.self, forKey: .homepage)
        imdbID = try? container.decode(String.self, forKey: .imdbID)
        originalLanguage = try? container.decode(String.self, forKey: .originalLanguage)
        originalTitle = try? container.decode(String.self, forKey: .originalTitle)
        overview = try? container.decode(String.self, forKey: .overview)
        popularity = try? container.decode(Double.self, forKey: .popularity)
        posterPath = try? container.decode(String.self, forKey: .posterPath)
        productionCompanies = try? container.decode([Company].self, forKey: .productionCompanies)
        productionCountries = try? container.decode([Country].self, forKey: .productionCountires)
        releaseDate = try? container.decode(Date.self, forKey: .releaseDate)
        revenue = try? container.decode(Int.self, forKey: .revenue)
        runtime = try? container.decode(Int.self, forKey: .runtime)
        spokenLanguages = try? container.decode([Language].self, forKey: .spokenLanguages)
        status = try? container.decode(String.self, forKey: .status)
        tagline = try? container.decode(String.self, forKey: .tagline)
        title = try? container.decode(String.self, forKey: .title)
        video = try? container.decode(Bool.self, forKey: .video)
        voteAverage = try? container.decode(Double.self, forKey: .voteAverage)
        voteCount = try? container.decode(Int.self, forKey: .voteCount)
    }
}
