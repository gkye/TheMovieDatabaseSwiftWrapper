import Foundation

// TODO: Handle people Type
public enum TrendingMediaType: String {
    case tv, movie
}

public enum TrendingTimeWindow: String {
    case day, week
}

open class TrendingMDB: Codable {
    open var overview: String?
    open var popularity: Double?
    open var id: Int!
    open var backdrop_path: String?
    open var vote_average: Double?
    open var original_language: String?
    open var vote_count: Double?
    open var poster_path: String?
    open var genre_ids: [Int]?

    /// Get the daily or weekly trending items. The daily trending list tracks items over the period of a day while items have a 24 hour half life. The weekly list tracks items over a 7 day period, with a 7 day half life.
    /// - Parameters:
    ///   - mediaType: TV or Movie
    ///   - timeWindow: Day or Week
    public class func trending(mediaType: TrendingMediaType, timeWindow: TrendingTimeWindow, completionHandler: @escaping (ClientReturn, _ movieData: [MovieMDB]?, _ tvData: [TVMDB]?) -> Void) {
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
