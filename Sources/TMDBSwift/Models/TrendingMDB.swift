import Foundation

public enum TrendingMediaType: String {
    case tv, movie
}

public enum TrendingTimeWindow: String {
    case day, week
}

public class TrendingMDB: Decodable {
    public var overview: String?
    public var popularity: Double?
    public var id: Int!
    public var backdrop_path: String?
    public var vote_average: Double?
    public var original_language: String?
    public var vote_count: Double?
    public var poster_path: String?
    public var genre_ids: [Int]?

    /// Get the daily or weekly trending items. The daily trending list tracks items over the period of a day while items have a 24 hour half life. The weekly list tracks items over a 7 day period, with a 7 day half life.
    /// - Parameters:
    ///   - mediaType: TV or Movie
    ///   - timeWindow: Day or Week
    public static func trending(mediaType: TrendingMediaType, timeWindow: TrendingTimeWindow, completionHandler: @escaping (ClientReturn, _ movieData: [MovieMDB]?, _ tvData: [TVMDB]?) -> Void) {
        Client.trending(baseURL: mediaType.rawValue + "/" + timeWindow.rawValue, completion: { apiReturn in
            if mediaType == .tv {
                let data: [TVMDB]? = apiReturn.decodeResults()
                completionHandler(apiReturn, nil, data)
            } else {
                let data: [MovieMDB]? = apiReturn.decodeResults()
                completionHandler(apiReturn, data, nil)
            }
        })
    }
}
