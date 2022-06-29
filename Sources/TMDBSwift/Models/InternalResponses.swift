import Foundation

struct ResultsResponse<T: Decodable>: Decodable {
    var id: Int
    var results: T
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

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        imdb = try? container.decode(String.self, forKey: .imdb)
        facebook = try? container.decode(String.self, forKey: .facebook)
        instagram = try? container.decode(String.self, forKey: .instagram)
        twitter = try? container.decode(String.self, forKey: .twitter)
    }
}
