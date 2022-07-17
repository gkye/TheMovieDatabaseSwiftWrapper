import Foundation

/// Contains information about a movie with many optional attributes.
public struct Movie: Codable, Equatable {
    /// The ID of a movie from the database.
    ///
    /// Used in services to fetch additional data for a particular ID.
    public var id: Int
    /// <#Description#>
    public var adult: Bool?
    /// The backdrop image path.
    ///
    /// To build an image URL, you will need 3 pieces of data. The `base_url`, `size` and `file_path`. Simply combine them all and you will have a fully qualified URL.
    ///
    /// Here’s an example URL:
    /// ```
    /// https://image.tmdb.org/t/p/w500/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg
    /// ```
    ///
    public var backdropPath: String?
    /// The budget for production, rounded to the nearest ``Int``.
    public var budget: Int?
    /// The collection of movies that contains this ID.
    public var collection: Collection?
    /// The related genres.
    public var genres: [Genre]?
    /// An external website's path.
    ///
    /// This is not necessarily a The Movie Database website.
    public var homepage: String?
    /// The IMDB ID.
    public var imdbID: ExternalIDType?
    /// <#Description#>
    public var mediaType: String?
    /// The language from its original release.
    public var originalLanguage: Language?
    /// The official title from its original release.
    public var originalTitle: String?
    /// The overview.
    public var overview: String?
    /// The popularity rating with respect to The Movie Database.
    public var popularity: Double?
    /// The poster image path.
    ///
    /// To build an image URL, you will need 3 pieces of data. The `base_url`, `size` and `file_path`. Simply combine them all and you will have a fully qualified URL.
    ///
    /// Here’s an example URL:
    /// ```
    /// https://image.tmdb.org/t/p/w500/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg
    /// ```
    ///
    public var posterPath: String?
    /// The production companies.
    public var productionCompanies: [Company]?
    /// The contries used for production.
    public var productionCountries: [Country]?
    /// The release date.
    public var releaseDate: Date?
    /// The revenue generated from the box office.
    public var revenue: Int?
    /// The runtime in minutes.
    public var runtime: Int?
    /// <#Description#>
    public var spokenLanguages: [Language]? // simplify to array of language types?
    /// The production status.
    public var status: String? // change to enum?
    /// The tagline.
    public var tagline: String?
    /// The title.
    public var title: String?
    /// <#Description#>
    public var video: Bool?
    /// The average user rating.
    public var voteAverage: Double?
    /// The total number of user ratings.
    public var voteCount: Int?

    public init(id: Int,
                adult: Bool? = nil,
                backdropPath: String? = nil,
                budget: Int? = nil,
                collection: Collection? = nil,
                genres: [Genre]? = nil,
                homepage: String? = nil,
                imdbID: ExternalIDType? = nil,
                mediaType: String? = nil,
                originalLanguage: Language? = nil,
                originalTitle: String? = nil,
                overview: String? = nil,
                popularity: Double? = nil,
                productionCompanies: [Company]? = nil,
                productionCountries: [Country]? = nil,
                releaseDate: Date? = nil,
                revenue: Int? = nil,
                runtime: Int? = nil,
                spokenLanguages: [Language]? = nil,
                status: String? = nil,
                tagline: String? = nil,
                title: String? = nil,
                video: Bool? = nil,
                voteAverage: Double? = nil,
                voteCount: Int? = nil) {
        self.id = id
        self.adult = adult
        self.backdropPath = backdropPath
        self.budget = budget
        self.collection = collection
        self.genres = genres
        self.homepage = homepage
        self.imdbID = imdbID
        self.mediaType = mediaType
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.productionCompanies = productionCompanies
        self.productionCountries = productionCountries
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.runtime = runtime
        self.spokenLanguages = spokenLanguages
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }

    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case backdropPath = "backdrop_path"
        case budget
        case collection = "belongs_to_collection"
        case genreIDs = "genre_ids"
        case genres
        case homepage
        case imdbID = "imdb_id"
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
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

    enum ProductionCompanyCodingKeys: String, CodingKey {
        case country = "iso_3166_1"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try? container.encode(adult, forKey: .adult)
        try? container.encode(backdropPath, forKey: .backdropPath)
        try? container.encode(budget, forKey: .budget)
        try? container.encode(collection, forKey: .collection)
        try? container.encode(genres, forKey: .genres)
        try? container.encode(homepage, forKey: .homepage)
        try? container.encode(imdbID?.id, forKey: .imdbID)
        try? container.encode(mediaType, forKey: .mediaType)
        try? container.encode(originalLanguage, forKey: .originalLanguage)
        try? container.encode(originalTitle, forKey: .originalTitle)
        try? container.encode(overview, forKey: .overview)
        try? container.encode(popularity, forKey: .popularity)
        try? container.encode(posterPath, forKey: .posterPath)
        try? container.encode(productionCompanies, forKey: .productionCompanies)

        if let productionCountries = productionCountries {
            var countryDict: [[String: String]] = []
            for country in productionCountries {
                countryDict.append([ProductionCompanyCodingKeys.country.stringValue: country.rawValue])
            }
            try? container.encode(countryDict, forKey: .productionCountries)
        }

        if let releaseDate = releaseDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            try? container.encode(dateFormatter.string(from: releaseDate), forKey: .releaseDate)
        }
        try? container.encode(revenue, forKey: .revenue)
        try? container.encode(runtime, forKey: .runtime)
        if let spokenLanguages = spokenLanguages {
            var languageDict: [[String: String]] = []
            for language in spokenLanguages {
                languageDict.append([SpokenLanguageCodingKeys.language.stringValue: language.rawValue])
            }
            try? container.encode(languageDict, forKey: .spokenLanguages)
        }
        try? container.encode(status, forKey: .status)
        try? container.encode(tagline, forKey: .tagline)
        try? container.encode(title, forKey: .title)
        try? container.encode(video, forKey: .video)
        try? container.encode(voteAverage, forKey: .voteAverage)
        try? container.encode(voteCount, forKey: .voteCount)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        adult = try? container.decode(Bool.self, forKey: .adult)
        backdropPath = try? container.decode(String.self, forKey: .backdropPath)
        budget = try? container.decode(Int.self, forKey: .budget)
        collection = try? container.decode(Collection.self, forKey: .collection)
        if let genreArray = try? container.decode([Genre].self, forKey: .genres) {
            genres = genreArray
        } else if let genreIDs = try? container.decode([Int].self, forKey: .genreIDs) {
            genres = genreIDs.map({ Genre(id: $0) })
        }
        homepage = try? container.decode(String.self, forKey: .homepage)
        if let imdbIDString = try? container.decode(String.self, forKey: .imdbID) {
            imdbID = ExternalIDType.imdb(imdbIDString)
        }
        mediaType = try? container.decode(String.self, forKey: .mediaType)
        originalLanguage = try? container.decode(Language.self, forKey: .originalLanguage)
        originalTitle = try? container.decode(String.self, forKey: .originalTitle)
        overview = try? container.decode(String.self, forKey: .overview)
        popularity = try? container.decode(Double.self, forKey: .popularity)
        posterPath = try? container.decode(String.self, forKey: .posterPath)
        productionCompanies = try? container.decode([Company].self, forKey: .productionCompanies)

        if var countryContent = try? container.nestedUnkeyedContainer(forKey: .productionCountries) {
            var countries: [Country] = []

            while !countryContent.isAtEnd {
                if let country = try? countryContent.nestedContainer(keyedBy: ProductionCompanyCodingKeys.self) {
                    if let supportedCountry = try? country.decode(Country.self, forKey: .country) {
                        countries.append(supportedCountry)
                    }
                } else {
                    break
                }
            }
            productionCountries = countries
        }

        if let dateString = try? container.decode(String.self, forKey: .releaseDate) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            releaseDate = dateFormatter.date(from: dateString)
        }
        revenue = try? container.decode(Int.self, forKey: .revenue)
        runtime = try? container.decode(Int.self, forKey: .runtime)

        if var content = try? container.nestedUnkeyedContainer(forKey: .spokenLanguages) {
            var languages: [Language] = []

            while !content.isAtEnd {
                if let language = try? content.nestedContainer(keyedBy: SpokenLanguageCodingKeys.self) {
                    if let supportedLanguage = try? language.decode(Language.self, forKey: .language) {
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
        title = try? container.decode(String.self, forKey: .title)
        video = try? container.decode(Bool.self, forKey: .video)
        voteAverage = try? container.decode(Double.self, forKey: .voteAverage)
        voteCount = try? container.decode(Int.self, forKey: .voteCount)
    }
}
