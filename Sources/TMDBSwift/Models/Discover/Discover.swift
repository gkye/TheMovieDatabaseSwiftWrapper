//
//  DiscoverTV.swift
//  TheMovieDbSwiftWrapper
//
//  Created by George Kye on 2016-02-05.
//  Copyright © 2016 George Kye. All rights reserved.

import Foundation

public enum DiscoverSortBy: String {

    case popularity_asc = "popularity.asc"
    case  popularity_desc = "popularity_desc"
    case vote_average_asc = "vote_average.asc"
    case vote_average_desc = "vote_average.desc"
}

public enum DiscoverType: String {
    case tv, movie
}

public enum DiscoverParam {
    case sort_by(String?)
    case certification_country(String?)
    case certification(String?)
    case certification_lte(String?)
    case include_adult(Bool?)
    case include_video(Bool?)
    case primary_release_year(Int?)
    case primary_release_date_gte(String?)
    case primary_release_date_lte(String?)
    case release_date_gte(String?)
    case release_date_lte(String?)
    case air_date_gte(String?)
    case air_date_lte(String?)
    case first_air_date_gte(String?)
    case first_air_date_lte(String?)
    case first_air_date_year(String?)
    case language(String?)
    case page(Int?)
    case timezone(String?)
    case vote_average_gte(Double?)
    case vote_average_lte(Double?)
    case vote_count_gte(Int?)
    case vote_count_lte(Int?)
    case with_genres(String?)
    case with_cast(String?)
    case with_crew(String?)
    case with_companies(String?)
    case with_keywords(String?)
    case with_people(String?)
    case with_networks(String?)
    case year(Int?)
    case certification_gte(String?)
}

open class DiscoverMDB: ArrayObject {
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

    /// Discover a movie or tv shows by different types of data like average rating, number of votes, genres and certifications.
    /// - Parameters:
    ///   - discoverType: TV or Movie
    ///   - params: Optional parameters. See more at https://developers.themoviedb.org/3/discover
    public class func discover(discoverType: DiscoverType, params: [DiscoverParam], completionHandler: @escaping (ClientReturn, _ movieData: [MovieMDB]?, _ tvData: [TVMDB]?) -> Void) {
        Client.discover(baseURL: discoverType.rawValue, params: params, completion: { data in
            let type = discoverType.rawValue.lowercased()
            if type == "tv"{
                completionHandler(data, nil, TVMDB.initialize(json: (data.json?["results"])!))
            } else {
                completionHandler(data, MovieMDB.initialize(json: (data.json?["results"])!), nil)
            }
        })
    }

    @available(*, deprecated, message: "Will be removed next release. Please use `discover(discoverType: DiscoverType, params: [DiscoverParam])` instead")
    public class func discover(discoverType: DiscoverType, language: String? = nil, page: Int, sort_by: String? = nil, year: Int? = nil, certification_country: String? = nil, certification: String? = nil, certification_gte: String? = nil, certification_lte: String? = nil, include_adult: Bool? = nil, include_video: Bool? = nil, timezone: String? = nil, primary_release_year: Int? = nil, primary_release_date_gte: String? = nil, primary_release_date_lte: String? = nil, release_date_gte: String? = nil, release_date_lte: String? = nil, vote_average_gte: Double? = nil, vote_average_lte: Double? = nil, vote_count_gte: Int? = nil, vote_count_lte: Int? = nil, with_genres: String? = nil, with_cast: String? = nil, with_crew: String? = nil, with_companies: String? = nil, with_keywords: String? = nil, with_people: String? = nil, air_date_gte: String? = nil, air_date_lte: String? = nil, first_air_date_year: String? = nil, first_air_date_lte: String? = nil, first_air_date_gte: String? = nil, with_networks: String? = nil, completionHandler: @escaping (ClientReturn, _ movieData: [MovieMDB]?, _ tvData: [TVMDB]?) -> Void) {

        Client.discover(baseURL: discoverType.rawValue, sort_by: sort_by, certification_country: certification_country, certification: certification, certification_lte: certification_lte, include_adult: include_adult, include_video: include_video, primary_release_year: primary_release_year, primary_release_date_gte: primary_release_date_gte, primary_release_date_lte: primary_release_date_lte, release_date_gte: release_date_gte, release_date_lte: release_date_lte, air_date_gte: air_date_gte, air_date_lte: air_date_lte, first_air_date_gte: first_air_date_gte, first_air_date_lte: first_air_date_gte, first_air_date_year: first_air_date_year, language: language, page: page, timezone: timezone, vote_average_gte: vote_average_gte, vote_average_lte: vote_average_lte, vote_count_gte: vote_count_gte, vote_count_lte: vote_count_lte, with_genres: with_genres, with_cast: with_cast, with_crew: with_crew, with_companies: with_companies, with_keywords: with_keywords, with_people: with_people, with_networks: with_networks, year: year, certification_gte: certification_gte) {

            let data = $0
            let type = discoverType.rawValue.lowercased()
            if type == "tv"{
                completionHandler(data, nil, TVMDB.initialize(json: (data.json?["results"])!))
            } else {
                completionHandler(data, MovieMDB.initialize(json: (data.json?["results"])!), nil)
            }
        }
    }

    /// Discover movie by rating
    public class func discoverByRating(discoverType: DiscoverType, certification: String, certification_country: String, ceritfication_lte: String? = nil, ceritfication_gte: String? = nil, sort_by: String? = nil, page: Int?, language: String?, completionHandler: @escaping (ClientReturn) -> Void) {
        Client.discover(baseURL: discoverType.rawValue, sort_by: sort_by, certification_country: certification_country, certification: certification, certification_lte: ceritfication_lte, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page, timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: nil, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil, certification_gte: ceritfication_gte) { apiReturn in
            completionHandler(apiReturn)
        }

    }
}
