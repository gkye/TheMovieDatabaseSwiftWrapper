//
//  TVMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//
//TODO: - tanslations
//

import Foundation

public enum TVQueryType: String{
  case latest, popular
  case airingtoday = "airing_today"
  case ontheair = "on_the_air"
  case toprated = "top_rated"
}


extension TVMDB{
  
  ///Get the primary information about a TV series by id.
  public class func tv(tvShowID: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVDetailedMDB?) -> ()) -> (){
    
    Client.TV(String(tvShowID),  page: nil, language: language, timezone: nil){
      apiReturn in
      var data: TVDetailedMDB?
      if(apiReturn.error == nil){
        data = TVDetailedMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the alternative titles for a specific show ID.
  public class func alternativeTitles(tvShowID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: Alternative_TitlesMDB?) -> ()) -> (){
    Client.TV( String(tvShowID) + "/alternative_titles",  page: nil, language: nil, timezone: nil){
      apiReturn in
      var data: Alternative_TitlesMDB?
      if(apiReturn.error == nil){
        data = Alternative_TitlesMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the content ratings for a specific TV show id.
  public class func content_ratings(tvShowID: Int,  completion: @escaping (_ clientReturn: ClientReturn, _ data: [Content_RatingsMDB]?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/content_ratings",  page: nil, language: nil, timezone: nil){
      apiReturn in
      var data: [Content_RatingsMDB]?
      if(apiReturn.error == nil){
        data = Content_RatingsMDB.initialize(json: apiReturn.json!["results"])
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the cast & crew information about a TV series. Just like the website, this information from the last season of the series.
  public class func credits(tvShowID: Int!, completion: @escaping (_ clientResult: ClientReturn, _ data: TVCreditsMDB?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/credits",  page: nil, language: nil, timezone: nil){
      apiReturn in
      var data: TVCreditsMDB?
      if(apiReturn.error == nil){
        data =  TVCreditsMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  //Get the external ids that we have stored for a TV series.
  public class func externalIDS(tvShowID: Int!, language: String, completion: @escaping (_ clientResult: ClientReturn, _ data: ExternalIdsMDB?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/external_ids",  page: nil, language: language, timezone: nil){
      apiReturn in
      var data: ExternalIdsMDB?
      if(apiReturn.error == nil){
        data = ExternalIdsMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the images (posters and backdrops) for a TV series.
  public class func images(tvShowID: Int!, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: ImagesMDB?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/images",  page: nil, language: language, timezone: nil){
      apiReturn in
      var data: ImagesMDB?
      if(apiReturn.error == nil){
        data = ImagesMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the plot keywords for a specific TV show id.
  public class func keywords(tvShowID: Int!, completion: @escaping (_ clientResult: ClientReturn, _ data: [KeywordsMDB]?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/keywords",  page: nil, language: nil, timezone: nil){
      apiReturn in
      var data: [KeywordsMDB]?
      if(apiReturn.error == nil){
        data = KeywordsMDB.initialize(json: apiReturn.json!["results"])
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the similar TV shows for a specific tv id.
  public  class func similar(tvShowID: Int!, page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/similar",  page: page, language: language, timezone: nil){
      apiReturn in
      var data: [TVMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          data = TVMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, data)
    }
  }
  ///Get the list of translations that exist for a TV series. These translations cascade down to the episode level.
  public class func translations(tvShowID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: [TranslationsMDB]?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/translations",  page: nil, language: nil, timezone: nil){
      apiReturn in
      var data: [TranslationsMDB]?
      if(apiReturn.error == nil){
        data = TranslationsMDB.initialize(json: apiReturn.json!["translations"])
      }
      completion(apiReturn, data)
    }
    
  }
  
  ///Get the videos that have been added to a TV series (trailers, opening credits, etc...)
  public class func videos(tvShowID: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [VideosMDB]?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/videos",  page: nil, language: language, timezone: nil){
      apiReturn in
      var data: [VideosMDB]?
      if(apiReturn.error == nil){
        data = VideosMDB.initialize(json: apiReturn.json!["results"])
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the latest TV show id.
  public class func latest( completion: @escaping (_ clientReturn: ClientReturn, _ data: TVDetailedMDB?) -> ()) -> (){
    Client.TV("latest",  page: nil, language: nil, timezone: nil){
      apiReturn in
      var data: TVDetailedMDB?
      if(apiReturn.error == nil){
        data = TVDetailedMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the list of TV shows that are currently on the air. This query looks for any TV show that has an episode with an air date in the next 7 days.
  public class func ontheair(page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.TV("on_the_air",  page: page, language: language, timezone: nil){
      apiReturn in
      var data: [TVMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          data = TVMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the list of TV shows that air today. Without a specified timezone, this query defaults to EST (Eastern Time UTC-05:00).
  public  class func airingtoday(page: Int?, language: String?, timezone: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.TV("airing_today",  page: page, language: language, timezone: timezone){
      apiReturn in
      var data: [TVMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          data = TVMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the list of top rated TV shows. By default, this list will only include TV shows that have 2 or more votes. This list refreshes every day.
  public class func toprated(page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.TV("top_rated",  page: page, language: language, timezone: nil){
      apiReturn in
      var data: [TVMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          data = TVMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the list of popular TV shows. This list refreshes every day.
  public class func popular(page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.TV("popular",  page: page, language: language, timezone: nil){
      apiReturn in
      var data: [TVMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          data = TVMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, data)
    }
  }
  
  
///Get data using TVQueryType Enum for popular, toprated, airing today and on air queries
  public class func query(queryType: TVQueryType, page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.TV(queryType.rawValue,  page: page, language: language, timezone: nil){
      apiReturn in
      var data: [TVMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          data = TVMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, data)
    }
  }
  
  
  /**
   *  Retrive data by append multiple tv methods. Initlization of object have to be done manually. Exepect TVMDB
   */
  public class func tvAppendTo(tvShowID: Int!, language: String? = nil, append_to: [String], completion: @escaping (_ clientReturn: ClientReturn, _ data: TVDetailedMDB?, _ json: JSON?) -> ()) -> (){
    
    Client.TV(String(tvShowID),  page: nil, language: language, timezone: nil, append_to: append_to){
      apiReturn in
      var data: TVDetailedMDB?
      if(apiReturn.error == nil){
        data = TVDetailedMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data, apiReturn.json)
    }
  }
}
