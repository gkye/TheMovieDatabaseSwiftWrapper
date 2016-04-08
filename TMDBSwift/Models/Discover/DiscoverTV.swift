//
//  DiscoverTV.swift
//  TheMovieDBWrapperSwift
//
//  Created by George on 2016-02-05.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation



public enum TVGenres: String{
    case Action_Adventure = "10759";
    case Animation = "16";
    case Comedy = "35";
    case Documentary = "99";
    case Drama = "18";
    case Education = "10761";
    case Family = "10751";
    case Kids = "10762";
    case Mystery = "9648";
    case News = "10763";
    case Reality = "10764";
    case ScifiFantasy = "10765";
    case Soap = "10766";
    case Talk = "10767";
    case WarPolitics = "10768";
    case Western = "37";
    
}

public class DiscoverTVMDB: DiscoverMDB {
    
    
    //    ///DiscoverTV query.  Language must be an ISO 639-1 code. Page must be greater than one. sort_by expected values can be found in DiscoverSortBy() and DiscoverSortByTV class variables. ALL parameters are optional
   public class func discoverTV(api_key: String, language: String?, sort_by: String?, page: Double?, completionHandler: (ClientReturn) -> ()) -> (){
        Client.discover(api_key, baseURL: "tv", sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page, timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: nil, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil, certification_gte: nil){
            apiReturn in
            completionHandler(apiReturn)
        }
    }
    
    ///lte = The minimum. gte = maximum. Expected date format is YYYY-MM-DD. Excpected year format is (####) ie.2010. ALL parameters are optional
   public class func discoverTV(api_key: String, first_air_date_year: String?, first_air_date_gte: String?, first_air_date_lte: String?, air_date_gte: String?, air_date_lte: String?, language: String?, sort_by: String?, page: Double?, timezone: String?, completionHandler: (ClientReturn) -> ()) -> (){
        
        Client.discover(api_key, baseURL: "tv", sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: air_date_gte, air_date_lte: air_date_lte, first_air_date_gte: first_air_date_gte, first_air_date_lte: first_air_date_lte, first_air_date_year: first_air_date_year, language: language, page: page, timezone: timezone, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: nil, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil, certification_gte: nil){
            apiReturn in
            completionHandler(apiReturn)
        }
    }
    
    ////DiscoverTV query.  Language must be an ISO 639-1 code. Page must be greater than one. sort_by expected values can be found in DiscoverSortBy() and DiscoverSortByTV class variables. lte = The minimum. gte = maximum. Expected date format is YYYY-MM-DD. Excpected year format is (####) ie.2010. ALL parameters are optional
    public class func discoverTV(api_key: String, language: String?, sort_by: String?, page: Double?, first_air_date_year: String?, first_air_date_gte: String?, first_air_date_lte: String?, air_date_gte: String?, air_date_lte: String?, timezone: String?, vote_average_gte: Double?, vote_count_gte: Double?, with_genres: String?, with_networks: String?, completionHandler: (ClientReturn) -> ()) -> (){
        
        Client.discover(api_key, baseURL: "tv", sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: air_date_gte, air_date_lte: air_date_lte, first_air_date_gte: first_air_date_gte, first_air_date_lte: first_air_date_lte, first_air_date_year: first_air_date_year, language: language, page: page, timezone: timezone, vote_average_gte: vote_average_gte, vote_average_lte: nil, vote_count_gte: vote_count_gte, vote_count_lte: nil, with_genres: with_genres, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: with_networks, year: nil, certification_gte: nil){
            apiReturn in
            completionHandler(apiReturn)
        }
    }
    
    //Discover tv shows with 
   public class func discoverTVWith(api_key: String, with_genres: String?, with_networks: String?, sort_by: String?, language: String?, page: Double?, completionHandler: (ClientReturn) -> ()) -> (){
        
        Client.discover(api_key, baseURL: "tv", sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page, timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: with_genres, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: with_networks, year: nil, certification_gte: nil){
            apiReturn in
            completionHandler(apiReturn)
        }
    }
    
    
}