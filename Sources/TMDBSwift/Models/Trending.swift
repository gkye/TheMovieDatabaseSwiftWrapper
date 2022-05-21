import Foundation

// TODO: Handle people Type
public enum TrendingMediaType: String {
    case tv, movie
}

public enum TrendingTimeWindow: String {
    case day, week
}

open class TrendingMDB: ArrayObject {
    open var overview: String?
    open var popularity: Double?
    open var id: Int!
    open var backdrop_path: String?
    open var vote_average: Double?
    open var original_language: String?
    open var vote_count: Double?
    open var poster_path: String?
    open var genre_ids: [Int]?

    required public init(results: JSON) {
        poster_path = results["poster_path"].string
        popularity = results["popularity"].double
        id = results["id"].int
        backdrop_path = results["backdrop_path"].string
        vote_average = results["vote_average"].double
        overview = results["overview"].string
        original_language = results["original_language"].string
        vote_count = results["vote_count"].double
        genre_ids = results["genre_ids"].arrayObject as? [Int]

    }

    /// Get the daily or weekly trending items. The daily trending list tracks items over the period of a day while items have a 24 hour half life. The weekly list tracks items over a 7 day period, with a 7 day half life.
    /// - Parameters:
    ///   - mediaType: TV or Movie
    ///   - timeWindow: Day or Week
    public class func trending(mediaType: TrendingMediaType, timeWindow: TrendingTimeWindow, completionHandler: @escaping (ClientReturn, _ movieData: [MovieMDB]?, _ tvData: [TVMDB]?) -> Void) {
        Client.trending(baseURL: mediaType.rawValue + "/" + timeWindow.rawValue, completion: { data in
            if mediaType == .tv {
                completionHandler(data, nil, TVMDB.initialize(json: (data.json?["results"])!))
            } else if mediaType == .movie {
                completionHandler(data, MovieMDB.initialize(json: (data.json?["results"])!), nil)
            }
        })
    }

}
