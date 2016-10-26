//
//  DiscoverMovie.swift
//  TheMovieDBWrapperSwift
//
//  Created by George Kye on 2016-02-05.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

public enum MovieGenres: String{
  case Action = "28";
  case Adventure = "12";
  case Animation = "16";
  case Comedy = "35";
  case Crime = "80";
  case Documentary = "99";
  case Drama = "18";
  case Family = "10751";
  case Fantasy = "14";
  case Foreign = "10769";
  case History = "36";
  case Horror = "27";
  case Music = "10402";
  case Mystery = "9648";
  case Romance = "10749";
  case ScienceFiction = "878";
  case TvMovie = "10770";
  case Thriller = "53";
  case War = "10752";
  case Western = "37";
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

open class DiscoverMovieMDB: DiscoverMDB{
  
  
  
  /// Discover movies by different types of data like average rating, number of votes, genres and certifications. You can get a valid list of certifications from the /certifications method. Please note, when using certification \ certification.lte you must also specify certification_country. These two parameters work together in order to filter the results.
  
  ///
  /// - parameter apikey:                   <#apikey description#>
  /// - parameter language:                 Specify a language to query translatable fields with.
  /// - parameter page:                     Specify the page of results to query.
  /// - parameter sort_by:                  Choose from one of the many available sort options (DiscoverSortByMovie)
  /// - parameter year:                     <#year description#>
  
  /// - parameter certification_country:    Used in conjunction with the certification filter, use this to specify a country with a valid certification.
  
  /// - parameter certification:            Filter results with a valid certification from the 'certification_country' field.
  /// - parameter certification_lte:        Filter and only include movies that have a certification that is less than or equal to the specified value.
  /// - parameter include_adult:            A filter and include or exclude adult movies.
  /// - parameter include_video:            A filter to include or exclude videos.
  /// - parameter timezone:                 <#timezone description#>
  /// - parameter primary_release_year:     A filter to limit the results to a specific primary release year.
  
  /// - parameter primary_release_date_gte: Filter and only include movies that have a primary release date that is greater or equal to the specified value.
  
  /// - parameter primary_release_date_lte: Filter and only include movies that have a primary release date that is less than or equal to the specified value.
  
  /// - parameter release_date_gte:         Filter and only include movies that have a release date (looking at all release dates) that is greater or equal to the specified value.
  
  /// - parameter release_date_lte:         Filter and only include movies that have a release date (looking at all release dates) that is less than or equal to the specified value.
  /// - parameter vote_average_gte:         Filter and only include movies that have a rating that is greater or equal to the specified value.
  /// - parameter vote_average_lte:         Filter and only include movies that have a rating that is less than or equal to the specified value.
  
  /// - parameter vote_count_gte:           Filter and only include movies that have a vote count that is greater or equal to the specified value.
  
  /// - parameter vote_count_lte:           Filter and only include movies that have a vote count that is less than or equal to the specified value.
  /// - parameter with_genres:              Comma separated value of genre ids that you want to include in the results.
  /// - parameter with_cast:                A comma separated list of person ID's. Only include movies that have one of the ID's added as an actor.
  /// - parameter with_crew:                A comma separated list of person ID's. Only include movies that have one of the ID's added as a crew member.
  
  /// - parameter with_companies:           A comma separated list of production company ID's. Only include movies that have one of the ID's added as a production company.
  
  /// - parameter with_keywords:            A comma separated list of keyword ID's. Only include movies that have one of the ID's added as a keyword.
  
  /// - parameter with_people:              A comma separated list of person ID's. Only include movies that have one of the ID's added as a either a actor or a crew member.
  
  /// - parameter completion:               Returns pageResults, the json and array of MovieMDB
  
  
  open class func discoverMovies(apikey: String, language: String? = nil, page: Double, sort_by: DiscoverSortByMovie? = nil, year: Float? = nil, certification_country: String? = nil, certification: String? = nil, certification_lte: String? = nil, include_adult: Bool? = nil, include_video: Bool? = nil, timezone: String? = nil, primary_release_year: String? = nil, primary_release_date_gte: String? = nil, primary_release_date_lte: String? = nil, release_date_gte: String? = nil, release_date_lte: String? = nil,vote_average_gte: Double? = nil, vote_average_lte: Double? = nil, vote_count_gte: Double? = nil, vote_count_lte: Double? = nil, with_genres: String? = nil, with_cast: String? = nil, with_crew: String? = nil, with_companies: String? = nil, with_keywords: String? = nil, with_people: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> ()) -> (){
    
    Client.discover(apikey, baseURL: "movie", sort_by: sort_by?.rawValue, certification_country: certification_country, certification: certification, certification_lte: certification_lte, include_adult: include_adult, include_video: include_video, primary_release_year: primary_release_year, primary_release_date_gte: primary_release_date_gte, primary_release_date_lte: primary_release_date_lte, release_date_gte: release_date_gte, release_date_lte: release_date_lte, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page, timezone: timezone, vote_average_gte: vote_count_gte, vote_average_lte: vote_average_lte, vote_count_gte: vote_count_gte, vote_count_lte: vote_count_lte, with_genres: with_genres, with_cast: with_cast, with_crew: with_crew, with_companies: with_companies, with_keywords: with_keywords, with_people: with_people, with_networks: nil, year: year, certification_gte: nil, completion: {
      apiReturn in
      var data: [MovieMDB]?
      if(apiReturn.error == nil){ data = MovieMDB.initialize(json: apiReturn.json!["results"]) }
      completion(apiReturn, data)
    })
  }
  
  
  ///all `_with` values-> comma separated indicates an 'AND' query, while a pipe (|) separated value indicates an 'OR'. ALL parameters are optional
  open class func discoverMoviesWith(_ api_key: String, with_genres: String? = nil, with_cast: String? = nil, with_crew: String? = nil, with_companies: String? = nil, with_keywords: String? = nil, with_people: String? = nil, with_networks: String? = nil, year: Float? = nil, sort_by: DiscoverSortByMovie? = nil, page: Double, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> ()) -> (){
    Client.discover(api_key, baseURL:"movie", sort_by: sort_by?.rawValue, certification_country: nil, certification: nil, certification_lte: nil, include_adult: nil, include_video: nil, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, air_date_gte: nil, air_date_lte: nil, first_air_date_gte: nil, first_air_date_lte: nil, first_air_date_year: nil, language: language, page: page, timezone: nil, vote_average_gte: nil, vote_average_lte: nil, vote_count_gte: nil, vote_count_lte: nil, with_genres: with_genres, with_cast: with_cast, with_crew: with_crew, with_companies: with_companies , with_keywords: with_keywords, with_people: with_people, with_networks: with_networks , year: year, certification_gte: nil){
      apiReturn in
      var data: [MovieMDB]?
      if(apiReturn.error == nil){ data = MovieMDB.initialize(json: apiReturn.json!["results"]) }
      completion(apiReturn, data)
    }
  }
  
  ///Get the list of movies associated with a particular company.
  open class func companyMovies(_ api_key: String!, companyId: Int!, language: String?, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> ()) -> (){
    Client.Company(api_key, companyId: companyId!, language: language, page: page){
      apiReturn in
      var data: [MovieMDB]?
      if(apiReturn.error == nil){ data = MovieMDB.initialize(json: apiReturn.json!["results"]) }
      completion(apiReturn, data)
    }
  }
  
  ///Get the list of movies for a particular keyword by id.
  //    class func keyword(api_key: String!, keywordId: Int!, page: Int?, completion: (ClientReturn) -> ()) -> (){
  //        Client.keyword(api_key, api_key: keywordId, page: page, language: true){
  //            apiReturn in
  //            completion(apiReturn)
  //        }
  //    }
  
  ///Get the list of movies for a particular genre by id. By default, only movies with 10 or more votes are included.
  open class func genreList(_ api_key: String!, genreId: Int, page: Double?, include_all_movies: Bool? = nil, include_adult: Bool? = nil, movieList: Bool? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> ()) -> (){
    Client.Genres(api_key, listType: "movie", language: nil, genreId: genreId, page: page, include_all_movies: include_all_movies, include_adult: nil, movieList: true){
      apiReturn in
      var data: [MovieMDB]?
      if(apiReturn.error == nil){ data = MovieMDB.initialize(json: apiReturn.json!["results"]) }
      completion(apiReturn, data)
    }
  }
  
  
}
