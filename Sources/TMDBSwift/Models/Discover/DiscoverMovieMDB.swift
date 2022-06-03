//
//  DiscoverMovie.swift
//  TheMovieDBWrapperSwift
//
//  Created by George Kye on 2016-02-05.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public enum MovieGenres: String {
    case Action = "28"
    case Adventure = "12"
    case Animation = "16"
    case Comedy = "35"
    case Crime = "80"
    case Documentary = "99"
    case Drama = "18"
    case Family = "10751"
    case Fantasy = "14"
    case Foreign = "10769"
    case History = "36"
    case Horror = "27"
    case Music = "10402"
    case Mystery = "9648"
    case Romance = "10749"
    case ScienceFiction = "878"
    case TvMovie = "10770"
    case Thriller = "53"
    case War = "10752"
    case Western = "37"
}

public enum DiscoverSortByMovie: String {
    case popularity_asc = "popularity.asc"
    case popularity_desc = "popularity.desc"
    case vote_average_asc = "vote_average.asc"
    case vote_average_desc = "vote_average.desc"
    case release_date_asc = "release_date.asc"
    case release_date_desc = "release_date.desc"
    case revenue_asc = "revenue.asc"
    case revenue_desc = "revenue.desc"
    case primary_release_date_asc = "primary_release_date.asc"
    case primary_release_date_desc = "primary_release_date.desc"
    case original_title_asc = "original_title.asc"
    case original_title_desc = "original_title.desc"
    case vote_count_asc = "vote_count.asc"
    case vote_count_desc = "vote_count.desc"

}

public class DiscoverMovieMDB: DiscoverMDB {
    public var title: String?
    public var video: Bool?
    public var adult: Bool?
    public var release_date: String?
    public var original_title: String?

    enum CodingKeys: String, CodingKey {
        case title
        case video
        case adult
        case release_date
        case original_title
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try super.init(from: decoder)
        title = try? container.decode(String?.self, forKey: .title)
        video = try? container.decode(Bool.self, forKey: .video)
        adult = try? container.decode(Bool.self, forKey: .adult)
        release_date = try? container.decode(String.self, forKey: .release_date)
        original_title = try? container.decode(String.self, forKey: .original_title)
    }

    /// Discover movies by different types of data like average rating, number of votes, genres and certifications. You can get a valid list of certifications from the /certifications method. Please note, when using certification \ certification.lte you must also specify certification_country. These two parameters work together in order to filter the results.
    public static func discoverMovies(params: [DiscoverParam], completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> Void) {
        Client.discover(baseURL: "movie", params: params, completion: { apiReturn in
            let data: [MovieMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        })
    }
}
