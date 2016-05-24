//
//  DiscoverTV.swift
//  TheMovieDbSwiftWrapper
//
//  Created by George on 2016-02-05.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

public enum DiscoverSortBy: String  {
    
    case popularity_asc = "popularity.asc";
    case  popularity_desc = "popularity_desc";
    case vote_average_asc = "vote_average.asc";
    case vote_average_desc = "vote_average.desc";
}

public enum DiscoverSortByMovie: String {
    //FIND WAY TO INHERIT FROM MAIN
    case popularity_asc = "popularity.asc";
    case  popularity_desc = "popularity_desc";
    case vote_average_asc = "vote_average.asc";
    case vote_average_desc = "vote_average.desc";
    
    case release_date_asc = "release_date.asc";
    case release_date_desc = "release_date.desc";
    case revenue_asc = "revenue.asc";
    case revenue_desc = "revenue.desc";
    case primary_release_date_asc = "primary_release_date.asc";
    case primary_release_date_desc = "primary_release_date.desc";
    case original_title_asc = "original_title.asc";
    case original_title_desc = "original_title.desc";
    case vote_count_asc = "vote_count.asc";
    case vote_count_desc = "vote_count.desc";
    
}

public enum DiscoverSortByTV: String {
    
    case popularity_asc = "popularity.asc";
    case  popularity_desc = "popularity_desc";
    case vote_average_asc = "vote_average.asc";
    case vote_average_desc = "vote_average.desc";
    
    case first_air_date_desc = "first_air_date.desc";
    case first_air_date_asc = "first_air_date.asc";
}


public class DiscoverMDB: ArrayObject {
    public var adult: Bool!
    public var overview: String?
    public var popularity: Double?
    public var id: Double?
    public var backdrop_path: String?
    public var vote_average: Double?
    public var original_language: String?
    public var vote_count: Double?
    public var poster_path: String?
    public var genre_ids: [Int]?
    
    required public init(results: JSON){
        poster_path = results["poster_path"].string
        popularity = results["popularity"].double
        id = results["id"].double
        backdrop_path = results["backdrop_path"].string
        vote_average = results["vote_average"].double
        overview = results["overview"].string
        original_language = results["original_language"].string
        vote_count = results["vote_count"].double
        genre_ids = results["genre_ids"].arrayObject as? [Int]
        
    }
    
    ///Simple discover query. Discover type = "tv" or "movie". Language must be an ISO 639-1 code.
    public class func discover(api_key: String, discoverType: String!, language: String?,completionHandler: (ClientReturn) -> ()) -> (){
        Client.discover(api_key, baseURL: discoverType, sort_by: nil, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: nil,  timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: nil, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil,  certification_gte: nil){
            apiReturn in
            completionHandler(apiReturn)
        }
    }
    
    ///Discover query. Discover type = "tv" or "movie".  Language must be an ISO 639-1 code. Page must be greater than one. sort_by expected values can be found in DiscoverSortBy(), DiscoverSortByTV and DiscoverSortByMovie.
    public  class func discover(api_key: String, discoverType: String!, language: String?, sort_by: String?, page: Double?,completionHandler: (ClientReturn) -> ()) -> (){
        
        Client.discover(api_key, baseURL: discoverType, sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page,  timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: nil, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil, certification_gte: nil){
            apiReturn in
            completionHandler(apiReturn)
            
        }
        
    }
    ///Discover query. Discover type = "tv" or "movie".  Language must be an ISO 639-1 code. Page must be greater than one. sort_by expected values can be found in DiscoverSortBy(), DiscoverSortByTV and DiscoverSortByMovie. With_genres expected value is an integer (the id of a genre). Multiple values can be specified. Comma separated indicates an 'AND' query, while a pipe (|) separated value indicates an 'OR'.
    public class func discover(api_key: String, discoverType: String!, language: String?, sort_by: String?, page: Double?, with_genres: String?, completionHandler: (ClientReturn) -> ()) -> (){
        Client.discover(api_key, baseURL: discoverType, sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page,  timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: with_genres, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil, certification_gte: nil){
            apiReturn in
            completionHandler(apiReturn)
            
        }
    }
    ///Discover query. Discover type = "tv" or "movie".  Language must be an ISO 639-1 code. Page must be greater than one. sort_by expected values can be found in DiscoverSortBy(), DiscoverSortByTV and DiscoverSortByMovie. With_genres expected value is an integer (the id of a genre). Multiple values can be specified. Comma separated indicates an 'AND' query, while a pipe (|) separated value indicates an 'OR'. `gte` =  Only include TV shows OR Movies that are equal to, or have a higher average rating than this value.
    public class func discover(api_key: String, discoverType: String!, language: String?, sort_by: String?,  page: Double?, with_genres: String??, vote_average_gte: Double?, vote_count_gte: Double?, completionHandler: (ClientReturn) -> ()) -> (){
        
        Client.discover(api_key, baseURL: discoverType, sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: nil, page: page,  timezone: nil, vote_average_gte: vote_average_gte, vote_average_lte: nil, vote_count_gte: vote_count_gte, vote_count_lte: nil, with_genres: with_genres!, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil,  certification_gte: nil){
            apiReturn in
            completionHandler(apiReturn)
            
        }
        
    }
    
    ///Discover movie by rating
    public class func discoverByRating(api_key: String, discoverType: String, certification: String, certification_country: String, ceritfication_lte: String?, ceritfication_gte: String?,  sort_by: String?, page: Double?,  language: String?,  completionHandler: (ClientReturn) -> ()) -> (){
        Client.discover(api_key, baseURL: discoverType, sort_by: sort_by, certification_country: certification_country, certification: certification, certification_lte: ceritfication_lte, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page,  timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: nil, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil, certification_gte: ceritfication_gte){
            apiReturn in
            completionHandler(apiReturn)
        }
        
    }
}