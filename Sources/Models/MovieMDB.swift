//
//  MoviesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

extension MovieMDB{
  
  ///Get the basic movie information for a specific movie id.
  public class func movie(_ api_key: String!, movieID: Int!, language: String? = nil , completion: @escaping (_ clientReturn: ClientReturn, _ data: MovieDetailedMDB?) -> ()) -> (){
    Client.Movies(String(movieID), api_key: api_key, page: nil, language: language){
      apiReturn in
      var detailed: MovieDetailedMDB?
      if(apiReturn.error == nil){
        detailed = MovieDetailedMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, detailed)
    }
  }
  
  ///Get the alternative titles for a specific movie id.
  public class func alternativeTitles(_ api_key: String!, movieID: Int!, country: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ altTitles: Alternative_TitlesMDB?) -> ()) -> (){
    //language changed to country to avoid modifiying multiple defined functions.
    Client.Movies(String(movieID) + "/alternative_titles", api_key: api_key, page: nil, language: country){
      apiReturn in
      var alt: Alternative_TitlesMDB?
      if(apiReturn.error == nil){
        alt = Alternative_TitlesMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, alt)
    }
  }
  
  ///Get the cast and crew information for a specific movie id.
  public  class func credits(_ api_key: String!, movieID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ credits: MovieCreditsMDB?) -> ()) -> (){
    Client.Movies(String(movieID) + "/credits", api_key: api_key, page: nil, language: nil){
      apiReturn in
      var credits: MovieCreditsMDB?
      if(apiReturn.error == nil){
        credits = MovieCreditsMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, credits)
    }
  }
  
  ///Get the images (posters and backdrops) for a specific movie id.
  public class func images(_ api_key: String!, movieID: Int!, language: String?  = nil, completion: @escaping (_ clientReturn: ClientReturn, _ images: ImagesMDB?) -> ()) -> (){
    Client.Movies(String(movieID) + "/images", api_key: api_key, page: nil, language: language){
      apiReturn in
      var images: ImagesMDB?
      if(apiReturn.error == nil){
        images = ImagesMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, images)
    }
  }
  
  ///Get the plot keywords for a specific movie id.
  public class func keywords(_ api_key: String!, movieID: Int, completion: @escaping (_ clientReturn: ClientReturn, _ keywords: [KeywordsMDB]?) -> ()) -> (){
    Client.Movies(String(movieID) + "/keywords", api_key: api_key, page: nil, language: nil){
      apiReturn in
      var keywords: [KeywordsMDB]?
      if(apiReturn.error == nil){
        keywords = KeywordsMDB.initialize(json: apiReturn.json!["keywords"])
      }
      completion(apiReturn, keywords)
    }
    
  }
  
  ///Get the release dates, certifications and related information by country for a specific movie id.
  public class func release_dates(_ api_key: String!, movieID: Int, completion: @escaping (_ clientReturn: ClientReturn, _ releatedDates: [MovieReleaseDatesMDB]?) -> ()) -> (){
    Client.Movies(String(movieID) + "/release_dates", api_key: api_key, page: nil, language: nil){
      apiReturn in
      var releatedDates: [MovieReleaseDatesMDB]?
      if(apiReturn.error == nil){
        releatedDates = MovieReleaseDatesMDB.initialize(json: apiReturn.json!["results"])
      }
      completion(apiReturn, releatedDates)
    }
    
  }
  
  ///Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
  public class func videos(_ api_key: String!, movieID: Int!, language: String?  = nil, completion: @escaping (_ clientReturn: ClientReturn, _ videos: [VideosMDB]?) -> ()) -> (){
    Client.Movies(String(movieID) + "/videos", api_key: api_key, page: nil, language: language){
      apiReturn in
      var videos: [VideosMDB]?
      if(apiReturn.error == nil){
        videos = VideosMDB.initialize(json: apiReturn.json!["results"])
      }
      completion(apiReturn, videos)
    }
  }
  
  ///Get the translations for a specific movie id.
  public class func translations(_ api_key: String!, movieID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ translations: TranslationsMDB? ) -> ()) -> (){
    Client.Movies(String(movieID) + "/translations", api_key: api_key, page: nil, language: nil){
      apiReturn in
      var trans: TranslationsMDB?
      if(apiReturn.error == nil){
        trans = TranslationsMDB.init(results: apiReturn.json!["translations"])
      }
      completion(apiReturn, trans)
    }
    
  }
  
  ///Get the similar movies for a specific movie id.
  public class func similar(_ api_key: String!, movieID: Int!, page: Int?, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> ()) -> (){
    Client.Movies(String(movieID) + "/similar", api_key: api_key, page: page, language: language){
      apiReturn in
      var movie: [MovieMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          movie = MovieMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, movie)
    }
  }
  
  ///Get the reviews for a particular movie id.
  public class func reviews(_ api_key: String!, movieID: Int!, page: Int?, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ reviews: [MovieReviewsMDB]?) -> ()) -> (){
    Client.Movies(String(movieID) + "/reviews", api_key: api_key, page: page, language: language){
      apiReturn in
      var reviews: [MovieReviewsMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          reviews = MovieReviewsMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, reviews)
    }
    
  }
  
  ///Get the lists that the movie belongs to.
  public class func list(_ api_key: String!, movieID: Int!, page: Int?, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ list: [MovieListMDB]?) -> ()) -> (){
    Client.Movies(String(movieID) + "/lists", api_key: api_key, page: page, language: language){
      apiReturn in
      var list: [MovieListMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          list = MovieListMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, list)
    }
    
  }
  ///Get the latest movie id.
  public class func latest(_ api_key: String!, completion: @escaping (_ clientReturn: ClientReturn, _ moviesDetailed: MovieDetailedMDB?) -> ()) -> (){
    Client.Movies("latest", api_key: api_key, page: nil, language: nil){
      apiReturn in
      var movie: MovieDetailedMDB?
      if(apiReturn.error == nil){
        movie = MovieDetailedMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, movie)
    }
  }
  
  ///Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
  public class func nowplaying(_ api_key: String!,language: String? = nil, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> ()) -> (){
    Client.Movies("now_playing", api_key: api_key, page: page, language: language){
      apiReturn in
      var movie = [MovieMDB]()
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          let results = apiReturn.json!["results"]
          movie = MovieMDB.initialize(json: results)
        }
      }
      completion(apiReturn, movie)
    }
  }
  
  ///Get the list of popular movies on The Movie Database. This list refreshes every day.
  public class func popular(_ api_key: String!,language: String? = nil, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> ()) -> (){
    Client.Movies("popular", api_key: api_key, page: page, language: language){
      apiReturn in
      var movie = [MovieMDB]()
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          movie = MovieMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, movie)
    }
  }
  
  ///Get the list of top rated movies. By default, this list will only include movies that have 50 or more votes. This list refreshes every day.
  public class func toprated(_ api_key: String!,language: String? = nil, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> ()) -> (){
    Client.Movies("top_rated", api_key: api_key, page: page, language: language){
      apiReturn in
      var movie: [MovieMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          movie = MovieMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, movie)
    }
  }
  
  ///Get the list of upcoming movies by release date. This list refreshes every day.
  public class func upcoming(_ api_key: String!, page: Int?, language: String?  = nil, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> ()) -> (){
    Client.Movies("upcoming", api_key: api_key, page: page, language: language){
      apiReturn in
      var movie: [MovieMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          movie = MovieMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, movie)
    }
  }
  
  /**
   *  Retrive data by append multiple movie methods. Initlization of object have to be done manually. Exepect MovieDetailedMDB
   */
  public class func movieAppendTo(_ api_key: String!, movieID: Int!, append_to: [String], language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: MovieDetailedMDB?, _ json: JSON?) -> ()) -> (){
    Client.Movies(String(movieID), api_key: api_key, page: nil, language: language, append_to: append_to){
      apiReturn in
      var detailed: MovieDetailedMDB?
      if(apiReturn.error == nil){
        detailed = MovieDetailedMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, detailed, apiReturn.json)
    }
  }
}
