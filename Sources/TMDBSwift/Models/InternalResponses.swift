import Foundation

struct ResultsResponse<T: Codable>: Codable {
    var id: Int
    var results: T

    init(id: Int,
         results: T) {
        self.id = id
        self.results = results
    }
}

struct KeywordResponse: Codable {
    var id: Int
    var keywords: [Keyword] = []
}

struct AlternativeTitlesResponse: Codable {
    var id: Int
    var titles: [Title] = []
}

struct ExternalIDResponse: Codable {
    var id: Int
    var imdb: String?
    var facebook: String?
    var instagram: String?
    var twitter: String?

    enum CodingKeys: String, CodingKey {
        case id
        case imdb = "imdb_id"
        case facebook = "facebook_id"
        case instagram = "instagram_id"
        case twitter = "twitter_id"
    }

    init(id: Int, imdb: String?, facebook: String?, instagram: String?, twitter: String?) {
        self.id = id
        self.imdb = imdb
        self.facebook = facebook
        self.instagram = instagram
        self.twitter = twitter
    }
}

struct ImageResponse: Codable {
    var id: Int
    var backdrops: [Image]?
    var logos: [Image]?
    var posters: [Image]?

    init(id: Int,
         backdrops: [Image]? = nil,
         logos: [Image]? = nil,
         posters: [Image]? = nil) {
        self.id = id
        self.backdrops = backdrops
        self.logos = logos
        self.posters = posters
    }
}

struct ReleaseDateResponse: Codable, Equatable {
    var countryCode: String
    var releases: [Release]

    enum CodingKeys: String, CodingKey {
        case countryCode = "iso_3166_1"
        case releases = "release_dates"
    }
}
