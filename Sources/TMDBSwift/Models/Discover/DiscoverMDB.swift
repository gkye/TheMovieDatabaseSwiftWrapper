//
//  DiscoverTV.swift
//  TheMovieDbSwiftWrapper
//
//  Created by George Kye on 2016-02-05.
//  Copyright © 2016 George Kye. All rights reserved.

import Foundation

public enum DiscoverSortBy: String {

    case popularity_asc = "popularity.asc"
    case popularity_desc = "popularity_desc"
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

open class DiscoverMDB: Decodable {
    open var overview: String?
    open var popularity: Double?
    open var id: Int!
    open var backdrop_path: String?
    open var vote_average: Double?
    open var original_language: String?
    open var vote_count: Double?
    open var poster_path: String?
    open var genre_ids: [Int]?

    /// Discover a movie or tv shows by different types of data like average rating, number of votes, genres and certifications.
    /// - Parameters:
    ///   - discoverType: TV or Movie
    ///   - params: Optional parameters. See more at https://developers.themoviedb.org/3/discover
    public class func discover(discoverType: DiscoverType, params: [DiscoverParam], completionHandler: @escaping (ClientReturn, _ movieData: [MovieMDB]?, _ tvData: [TVMDB]?) -> Void) {
        Client.discover(baseURL: discoverType.rawValue, params: params, completion: { apiReturn in
            let type = discoverType.rawValue.lowercased()
            if type == "tv"{
                let data: [TVMDB]? = apiReturn.decodeResults()
                completionHandler(apiReturn, nil, data)
            } else {
                let data: [MovieMDB]? = apiReturn.decodeResults()
                completionHandler(apiReturn, data, nil)
            }
        })
    }
}
