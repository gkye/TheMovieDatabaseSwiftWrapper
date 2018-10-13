//
//  MoviesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public enum MovieQueryType: String{
	
	case nowplaying = "now_playing"
	case toprated = "top_rated"
	case upcoming = "upcoming"
	case popular = "popular"
}

extension MovieMDB{
  
  ///Get the basic movie information for a specific movie id.
  public class func movie(movieID: Int!, language: String? = nil , completion: @escaping (_ clientReturn: ClientReturn, _ data: MovieDetailedMDB?) -> ()) -> (){
    Client.Movies(String(movieID),  page: nil, language: language){
      apiReturn in
      var detailed: MovieDetailedMDB?
      if let json = apiReturn.json {
        detailed = MovieDetailedMDB.init(results: json)
      }
      completion(apiReturn, detailed)
    }
  }
  
  ///Get the alternative titles for a specific movie id.
  public class func alternativeTitles(movieID: Int!, country: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ altTitles: Alternative_TitlesMDB?) -> ()) -> (){
    //language changed to country to avoid modifiying multiple defined functions.
    Client.Movies(String(movieID) + "/alternative_titles",  page: nil, language: country){
      apiReturn in
      var alt: Alternative_TitlesMDB?
      if let json = apiReturn.json {
        alt = Alternative_TitlesMDB.init(results: json)
      }
      completion(apiReturn, alt)
    }
  }
  
  ///Get the cast and crew information for a specific movie id.
  public  class func credits(movieID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ credits: MovieCreditsMDB?) -> ()) -> (){
    Client.Movies(String(movieID) + "/credits",  page: nil, language: nil){
      apiReturn in
      var credits: MovieCreditsMDB?
      if let json = apiReturn.json {
        credits = MovieCreditsMDB(results: json)
      }
      completion(apiReturn, credits)
    }
  }
  
  ///Get the images (posters and backdrops) for a specific movie id.
  public class func images(movieID: Int!, language: String?  = nil, completion: @escaping (_ clientReturn: ClientReturn, _ images: ImagesMDB?) -> ()) -> (){
    Client.Movies(String(movieID) + "/images",  page: nil, language: language){
      apiReturn in
      var images: ImagesMDB?
      if let json = apiReturn.json {
        images = ImagesMDB.init(results: json)
      }
      completion(apiReturn, images)
    }
  }
  
  ///Get the plot keywords for a specific movie id.
  public class func keywords(movieID: Int, completion: @escaping (_ clientReturn: ClientReturn, _ keywords: [KeywordsMDB]?) -> ()) -> (){
    Client.Movies(String(movieID) + "/keywords",  page: nil, language: nil){
      apiReturn in
      var keywords: [KeywordsMDB]?
      if let json = apiReturn.json?["keywords"] {
        keywords = KeywordsMDB.initialize(json: json)
      }
      completion(apiReturn, keywords)
    }
    
  }
  
  ///Get the release dates, certifications and related information by country for a specific movie id.
  public class func release_dates(movieID: Int, completion: @escaping (_ clientReturn: ClientReturn, _ releatedDates: [MovieReleaseDatesMDB]?) -> ()) -> (){
    Client.Movies(String(movieID) + "/release_dates",  page: nil, language: nil){
      apiReturn in
      var releatedDates: [MovieReleaseDatesMDB]?
      if let json = apiReturn.json?["results"]  {
        releatedDates = MovieReleaseDatesMDB.initialize(json: json)
      }
      completion(apiReturn, releatedDates)
    }
    
  }

  ///Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
  public class func videos(movieID: Int!, language: String?  = nil, completion: @escaping (_ clientReturn: ClientReturn, _ videos: [VideosMDB]?) -> ()) -> (){
    Client.Movies(String(movieID) + "/videos",  page: nil, language: language){
      apiReturn in
      let videos: [VideosMDB]? = apiReturn.decodeResults()
      completion(apiReturn, videos)
    }
  }
  
  ///Get the translations for a specific movie id.
  public class func translations(movieID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ translations: TranslationsMDB? ) -> ()) -> (){
    Client.Movies(String(movieID) + "/translations",  page: nil, language: nil){
      apiReturn in
      var trans: TranslationsMDB?
      if let json = apiReturn.json?["translations"]  {
        trans = TranslationsMDB(results: json)
      }
      completion(apiReturn, trans)
    }
    
  }
  
  ///Get the similar movies for a specific movie id.
  public class func similar(movieID: Int!, page: Int?, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> ()) -> (){
    Client.Movies(String(movieID) + "/similar",  page: page, language: language){
      apiReturn in
      var movies: [MovieMDB]?
      if let json = apiReturn.json?["results"] {
        movies = MovieMDB.initialize(json: json)
      }
      completion(apiReturn, movies)
    }
  }
  
  ///Get the reviews for a particular movie id.
  public class func reviews(movieID: Int!, page: Int?, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ reviews: [MovieReviewsMDB]?) -> ()) -> (){
    Client.Movies(String(movieID) + "/reviews",  page: page, language: language){
      apiReturn in
      let reviews: [MovieReviewsMDB]? = apiReturn.decodeResults()
      completion(apiReturn, reviews)
    }
    
  }
  
  ///Get the lists that the movie belongs to.
  public class func list(movieID: Int!, page: Int?, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ list: [MovieListMDB]?) -> ()) -> (){
    Client.Movies(String(movieID) + "/lists",  page: page, language: language){
      apiReturn in
      var list: [MovieListMDB]?
      if let json = apiReturn.json?["results"] {
        list = MovieListMDB.initialize(json: json)
      }
      completion(apiReturn, list)
    }
    
  }
  ///Get the latest movie id.
  public class func latest(completion: @escaping (_ clientReturn: ClientReturn, _ moviesDetailed: MovieDetailedMDB?) -> ()) -> (){
    Client.Movies("latest",  page: nil, language: nil){
      apiReturn in
      var movie: MovieDetailedMDB?
      if let json = apiReturn.json {
        movie = MovieDetailedMDB.init(results: json)
      }
      completion(apiReturn, movie)
    }
  }
  
  ///Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
  public class func nowplaying(language: String? = nil, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> ()) -> (){
    Client.Movies("now_playing",  page: page, language: language){
      apiReturn in
      var movie = [MovieMDB]()
      if let json = apiReturn.json?["results"] {
        movie = MovieMDB.initialize(json: json)
      }
      completion(apiReturn, movie)
    }
  }
  
  ///Get the list of popular movies on The Movie Database. This list refreshes every day.
  public class func popular(language: String? = nil, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> ()) -> (){
    Client.Movies("popular",  page: page, language: language){
      apiReturn in
      var movie = [MovieMDB]()
      if let json = apiReturn.json?["results"] {
        movie = MovieMDB.initialize(json: json)
      }
      completion(apiReturn, movie)
    }
  }
  
  ///Get the list of top rated movies. By default, this list will only include movies that have 50 or more votes. This list refreshes every day.
  public class func toprated(language: String? = nil, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> ()) -> (){
    Client.Movies("top_rated",  page: page, language: language){
      apiReturn in
      var movie: [MovieMDB]?
      if let json = apiReturn.json?["results"] {
        movie = MovieMDB.initialize(json: json)
      }
      completion(apiReturn, movie)
    }
  }
  
  ///Get the list of upcoming movies by release date. This list refreshes every day.
  public class func upcoming(page: Int?, language: String?  = nil, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> ()) -> (){
    Client.Movies("upcoming",  page: page, language: language){
      apiReturn in
      var movie: [MovieMDB]?
      if let json = apiReturn.json?["results"] {
        movie = MovieMDB.initialize(json: json)
      }
      completion(apiReturn, movie)
    }
  }
	
	
	/// Retrive a list of movies using the `MovieQueryType`
  public class func query(queryType: MovieQueryType, language: String? = nil, page: Int?, region: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> ()) -> (){
    Client.Movies(queryType.rawValue,  page: page, language: language, region: region){
			apiReturn in
      var movie: [MovieMDB]?
      if let json = apiReturn.json?["results"] {
        movie = MovieMDB.initialize(json: json)
      }
			completion(apiReturn, movie)
		}
	}
	
  /**
   *  Retrive data by append multiple movie methods. Initlization of object have to be done manually. Exepect MovieDetailedMDB
   */
  public class func movieAppendTo(movieID: Int!, append_to: [String], language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: MovieDetailedMDB?, _ json: JSON?) -> ()) -> (){
    Client.Movies(String(movieID),  page: nil, language: language, append_to: append_to){
      apiReturn in
      var detailed: MovieDetailedMDB?
      if let json = apiReturn.json {
        detailed = MovieDetailedMDB.init(results: json)
      }
      completion(apiReturn, detailed, apiReturn.json)
    }
  }
}
