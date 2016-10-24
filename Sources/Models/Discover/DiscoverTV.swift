//
//  DiscoverTV.swift
//  TheMovieDBWrapperSwift
//
//  Created by George Kye on 2016-02-05.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

public enum TVGenres: String{
  case Action_Adventure = "10759";
  case Animation = "16";
  case Comedy = "35";
  case Crime = "80";
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

open class DiscoverTVMDB: DiscoverMDB {
  
  
  /// DiscoverTV query.  Language must be an ISO 639-1 code. Page must be greater than one. sort_by expected values can be found in DiscoverSortBy() and DiscoverSortByTV class variables. ALL parameters are optional
  open class func discoverTV(_ api_key: String, language: String?, sort_by: String? = nil, page: Double?, completionHandler: @escaping (_ clientReturn: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.discover(api_key, baseURL: "tv", sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page, timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: nil, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil, certification_gte: nil){
      apiReturn in
      var data: [TVMDB]?
      if(apiReturn.error == nil){
        data = TVMDB.initialize(json: apiReturn.json!["results"])
      }
      completionHandler(apiReturn, data)
    }
  }
  
  ///lte = The minimum. gte = maximum. Expected date format is YYYY-MM-DD. Excpected year format is (####) ie.2010. ALL parameters are optional
  open class func discoverTV(_ api_key: String, first_air_date_year: String? = nil, first_air_date_gte: String? = nil, first_air_date_lte: String? = nil, air_date_gte: String? = nil, air_date_lte: String? = nil, language: String?, sort_by: String? = nil, page: Double?, timezone: String? = nil, completionHandler: @escaping (_ clientReturn: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    
    Client.discover(api_key, baseURL: "tv", sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: air_date_gte, air_date_lte: air_date_lte, first_air_date_gte: first_air_date_gte, first_air_date_lte: first_air_date_lte, first_air_date_year: first_air_date_year, language: language, page: page, timezone: timezone, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: nil, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil, certification_gte: nil){
      apiReturn in
      var data: [TVMDB]?
      if(apiReturn.error == nil){
        data = TVMDB.initialize(json: apiReturn.json!["results"])
      }
      completionHandler(apiReturn, data)
    }
  }
  
  //// DiscoverTV query.  Language must be an ISO 639-1 code. Page must be greater than one. sort_by expected values can be found in DiscoverSortBy() and DiscoverSortByTV class variables. lte = The minimum. gte = maximum. Expected date format is YYYY-MM-DD. Excpected year format is (####) ie.2010. ALL parameters are optional
  open class func discoverTV(_ api_key: String, language: String?, sort_by: String? = nil, page: Double?, first_air_date_year: String? = nil, first_air_date_gte: String? = nil, first_air_date_lte: String? = nil, air_date_gte: String? = nil, air_date_lte: String? = nil, timezone: String? = nil, vote_average_gte: Double?, vote_count_gte: Double?, with_genres: String? = nil, with_networks: String? = nil, completionHandler: @escaping (_ clientReturn: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    
    Client.discover(api_key, baseURL: "tv", sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: air_date_gte, air_date_lte: air_date_lte, first_air_date_gte: first_air_date_gte, first_air_date_lte: first_air_date_lte, first_air_date_year: first_air_date_year, language: language, page: page, timezone: timezone, vote_average_gte: vote_average_gte, vote_average_lte: nil, vote_count_gte: vote_count_gte, vote_count_lte: nil, with_genres: with_genres, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: with_networks, year: nil, certification_gte: nil){
      apiReturn in
      var data: [TVMDB]?
      if(apiReturn.error == nil){
        data = TVMDB.initialize(json: apiReturn.json!["results"])
      }
      completionHandler(apiReturn, data)
    }
  }
  
  //Discover tv shows with
  open class func discoverTVWith(_ api_key: String, with_genres: String? = nil, with_networks: String? = nil, sort_by: String? = nil, language: String?, page: Double?, completionHandler: @escaping (_ clientReturn: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    
    Client.discover(api_key, baseURL: "tv", sort_by: sort_by, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page, timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: with_genres, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: with_networks, year: nil, certification_gte: nil){
      apiReturn in
      var data: [TVMDB]?
      if(apiReturn.error == nil){
        data = TVMDB.initialize(json: apiReturn.json!["results"])
      }
      completionHandler(apiReturn, data)
    }
  }
  
  
}
