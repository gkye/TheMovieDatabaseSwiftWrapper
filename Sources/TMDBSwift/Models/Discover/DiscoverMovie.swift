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
    // FIND WAY TO INHERIT FROM MAIN
    case popularity_asc = "popularity.asc"
    case  popularity_desc = "popularity.desc"
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

open class DiscoverMovieMDB: DiscoverMDB {
    open var title: String?
    open var video: Bool?
    open var adult: Bool?
    open var release_date: String?
    open var original_title: String?

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
    open class func discoverMovies(params: [DiscoverParam], completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> Void) {
        Client.discover(baseURL: "movie", params: params, completion: { apiReturn in
            let data: [MovieMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        })
    }

    /// Get the list of movies associated with a particular company.
    open class func companyMovies(companyId: Int!, language: String?, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> Void) {
        Client.Company(companyId: companyId!, language: language, page: page) { apiReturn in
            let data: [MovieMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the list of movies for a particular genre by id. By default, only movies with 10 or more votes are included.
    open class func genreList(genreId: Int, page: Double?, include_all_movies: Bool? = nil, include_adult: Bool? = nil, movieList: Bool? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> Void) {
        Client.Genres(listType: "movie", language: nil, genreId: genreId, page: page, include_all_movies: include_all_movies, include_adult: nil, movieList: true) { apiReturn in
            let data: [MovieMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }
}
