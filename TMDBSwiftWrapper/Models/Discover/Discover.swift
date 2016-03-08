//
//  DiscoverTV.swift
//  TheMovieDbSwiftWrapper
//
//  Created by George on 2016-02-05.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON
class DiscoverSortBy  {
    
    let popularity_asc = "popularity.asc";
    let popularity_desc = "popularity_desc";
    let vote_average_asc = "vote_average.asc";
    let vote_average_desc = "vote_average.desc";
}

class DiscoverSortByMovie: DiscoverSortBy {
    internal var release_date_asc = "release_date.asc";
    let release_date_desc = "release_date.desc";
    let revenue_asc = "revenue.asc";
    let revenue_desc = "revenue.desc";
    let primary_release_date_asc = "primary_release_date.asc";
    let primary_release_date_desc = "primary_release_date.desc";
    let original_title_asc = "original_title.asc";
    let original_title_desc = "original_title.desc";
    let vote_count_asc = "vote_count.asc";
    let vote_count_desc = "vote_count.desc";
    
}

class DiscoverSortByTV: DiscoverSortBy {
    let first_air_date_desc = "first_air_date.desc";
    let first_air_date_asc = "first_air_date.asc";
}


class Discover {
    var poster_path: String?
    var popularity: Double?
    var id: Double?
    var backdrop_path: NSString?
    var vote_average: Double?
    var overview: String?
    var original_language: String?
    var vote_count: Double?
    static var baseURL = ""
    
    //make all init variables non optinal (except ones which return `<NULL>`. ** Xcode bug?
   init(results: JSON){
        
        if(results["poster_path"].string != nil){
            poster_path = results["poster_path"].string
        }else{
            poster_path = nil
        }
        
        popularity = results["popularity"].double
        id = results["id"].double
        if(results["backdrop_path"].string != nil){
            backdrop_path = nil
        }else{
            backdrop_path = results["backdrop_path"].string
        }
        
        vote_average = results["vote_average"].double
        overview = results["overview"].string
        original_language = results["original_language"].string
        vote_count = results["vote_count"].double
        
    }
    
    
    ///Simple discover query. Discover type = "tv" or "movie". Language must be an ISO 639-1 code.
    class func discover(api_key: String, discoverType: String!, language: String?,completionHandler: (ClientReturn) -> ()) -> (){
        Client.discover(api_key, baseURL: discoverType, sort_by: nil, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: nil,  timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: nil, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil,  certification_gte: nil){
            apiReturn in
            completionHandler(apiReturn)
        }
    }
    
    ///Discover query. Discover type = "tv" or "movie".  Language must be an ISO 639-1 code. Page must be greater than one. sort_by expected values can be found in DiscoverSortBy(), DiscoverSortByTV and DiscoverSortByMovie.
    class func discover(api_key: String, discoverType: String!, language: String?, sort_by: String?, page: Double?,completionHandler: (ClientReturn) -> ()) -> (){
        
        Client.discover(api_key, baseURL: discoverType, sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page,  timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: nil, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil, certification_gte: nil){
            apiReturn in
            completionHandler(apiReturn)
            
        }
        
    }
    //
    //    ///Discover query. Discover type = "tv" or "movie".  Language must be an ISO 639-1 code. Page must be greater than one. sort_by expected values can be found in DiscoverSortBy(), DiscoverSortByTV and DiscoverSortByMovie. With_genres expected value is an integer (the id of a genre). Multiple values can be specified. Comma separated indicates an 'AND' query, while a pipe (|) separated value indicates an 'OR'.
    class func discover(api_key: String, discoverType: String!, language: String?, sort_by: String?, page: Double?, with_genres: String?, completionHandler: (ClientReturn) -> ()) -> (){
        Client.discover(api_key, baseURL: discoverType, sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page,  timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: with_genres, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil, certification_gte: nil){
            apiReturn in
            completionHandler(apiReturn)
            
        }
    }
    //
    //    ///Discover query. Discover type = "tv" or "movie".  Language must be an ISO 639-1 code. Page must be greater than one. sort_by expected values can be found in DiscoverSortBy(), DiscoverSortByTV and DiscoverSortByMovie. With_genres expected value is an integer (the id of a genre). Multiple values can be specified. Comma separated indicates an 'AND' query, while a pipe (|) separated value indicates an 'OR'. `gte` =  Only include TV shows OR Movies that are equal to, or have a higher average rating than this value.
    class func discover(api_key: String, discoverType: String!, language: String?, sort_by: String?,  page: Double?, with_genres: String??, vote_average_gte: Double?, vote_count_gte: Double?, completionHandler: (ClientReturn) -> ()) -> (){
        
        Client.discover(api_key, baseURL: discoverType, sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: nil, page: page,  timezone: nil, vote_average_gte: vote_average_gte, vote_average_lte: nil, vote_count_gte: vote_count_gte, vote_count_lte: nil, with_genres: with_genres!, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil,  certification_gte: nil){
            apiReturn in
            completionHandler(apiReturn)
            
        }
        
    }
    
    class func discoverByRating(api_key: String, discoverType: String, certification: String, certification_country: String, ceritfication_lte: String?, ceritfication_gte: String?,  sort_by: String?, page: Double?,  language: String?,  completionHandler: (ClientReturn) -> ()) -> (){
        
        Client.discover(api_key, baseURL: discoverType, sort_by: sort_by, certification_country: certification_country, certification: certification, certification_lte: ceritfication_lte, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page,  timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: nil, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil, certification_gte: ceritfication_gte){
            apiReturn in
            completionHandler(apiReturn)
        }
        
    }
}