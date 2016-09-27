//
//  TVMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George KyeKye. All rights reserved.
//
//TODO: - tanslations
//

import Foundation


extension TVMDB{
  
  ///Get the primary information about a TV series by id.
  public class func tv(_ api_key: String!, tvShowID: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVDetailedMDB?) -> ()) -> (){
    
    Client.TV(String(tvShowID), api_key: api_key, page: nil, language: language, timezone: nil){
      apiReturn in
      var data: TVDetailedMDB?
      if(apiReturn.error == nil){
        data = TVDetailedMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the alternative titles for a specific show ID.
  public class func alternativeTitles(_ api_key: String!, tvShowID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: Alternative_TitlesMDB?) -> ()) -> (){
    Client.TV( String(tvShowID) + "/alternative_titles", api_key: api_key, page: nil, language: nil, timezone: nil){
      apiReturn in
      var data: Alternative_TitlesMDB?
      if(apiReturn.error == nil){
        data = Alternative_TitlesMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the content ratings for a specific TV show id.
  public class func content_ratings(_ api_key: String, tvShowID: Int,  completion: @escaping (_ clientReturn: ClientReturn, _ data: [Content_RatingsMDB]?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/content_ratings", api_key: api_key, page: nil, language: nil, timezone: nil){
      apiReturn in
      var data: [Content_RatingsMDB]?
      if(apiReturn.error == nil){
        data = Content_RatingsMDB.initialize(json: apiReturn.json!["results"])
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the cast & crew information about a TV series. Just like the website, this information from the last season of the series.
  public class func credits(_ api_key: String!, tvShowID: Int!, completion: @escaping (_ clientResult: ClientReturn, _ data: TVCreditsMDB?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/credits", api_key: api_key, page: nil, language: nil, timezone: nil){
      apiReturn in
      var data: TVCreditsMDB?
      if(apiReturn.error == nil){
        data =  TVCreditsMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  //Get the external ids that we have stored for a TV series.
  public class func externalIDS(_ api_key: String!, tvShowID: Int!, language: String, completion: @escaping (_ clientResult: ClientReturn, _ data: ExternalIdsMDB?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/external_ids", api_key: api_key, page: nil, language: language, timezone: nil){
      apiReturn in
      var data: ExternalIdsMDB?
      if(apiReturn.error == nil){
        data = ExternalIdsMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the images (posters and backdrops) for a TV series.
  public class func images(_ api_key: String!, tvShowID: Int!, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: ImagesMDB?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/images", api_key: api_key, page: nil, language: language, timezone: nil){
      apiReturn in
      var data: ImagesMDB?
      if(apiReturn.error == nil){
        data = ImagesMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the plot keywords for a specific TV show id.
  public class func keywords(_ api_key: String, tvShowID: Int!, completion: @escaping (_ clientResult: ClientReturn, _ data: [KeywordsMDB]?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/keywords", api_key: api_key, page: nil, language: nil, timezone: nil){
      apiReturn in
      var data: [KeywordsMDB]?
      if(apiReturn.error == nil){
        data = KeywordsMDB.initialize(json: apiReturn.json!["results"])
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the similar TV shows for a specific tv id.
  public  class func similar(_ api_key: String!, tvShowID: Int!, page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/similar", api_key: api_key, page: page, language: language, timezone: nil){
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
  public class func translations(_ api_key: String!, tvShowID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: [TranslationsMDB]?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/translations", api_key: api_key, page: nil, language: nil, timezone: nil){
      apiReturn in
      var data: [TranslationsMDB]?
      if(apiReturn.error == nil){
        data = TranslationsMDB.initialize(json: apiReturn.json!["translations"])
      }
      completion(apiReturn, data)
    }
    
  }
  
  ///Get the videos that have been added to a TV series (trailers, opening credits, etc...)
  public class func videos(_ api_key: String!, tvShowID: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [VideosMDB]?) -> ()) -> (){
    Client.TV(String(tvShowID) + "/videos", api_key: api_key, page: nil, language: language, timezone: nil){
      apiReturn in
      var data: [VideosMDB]?
      if(apiReturn.error == nil){
        data = VideosMDB.initialize(json: apiReturn.json!["results"])
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the latest TV show id.
  public class func latest(_ api_key: String!,  completion: @escaping (_ clientReturn: ClientReturn, _ data: TVDetailedMDB?) -> ()) -> (){
    Client.TV("latest", api_key: api_key, page: nil, language: nil, timezone: nil){
      apiReturn in
      var data: TVDetailedMDB?
      if(apiReturn.error == nil){
        data = TVDetailedMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the list of TV shows that are currently on the air. This query looks for any TV show that has an episode with an air date in the next 7 days.
  public class func ontheair(_ api_key: String!, page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.TV("on_the_air", api_key: api_key, page: page, language: language, timezone: nil){
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
  public  class func airingtoday(_ api_key: String!, page: Int?, language: String?, timezone: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.TV("airing_today", api_key: api_key, page: page, language: language, timezone: timezone){
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
  public class func toprated(_ api_key: String!, page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.TV("top_rated", api_key: api_key, page: page, language: language, timezone: nil){
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
  public class func popular(_ api_key: String!, page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.TV("popular", api_key: api_key, page: page, language: language, timezone: nil){
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
  public class func tvAppendTo(_ api_key: String!, tvShowID: Int!, language: String? = nil, append_to: [String], completion: @escaping (_ clientReturn: ClientReturn, _ data: TVDetailedMDB?, _ json: JSON?) -> ()) -> (){
    
    Client.TV(String(tvShowID), api_key: api_key, page: nil, language: language, timezone: nil, append_to: append_to){
      apiReturn in
      var data: TVDetailedMDB?
      if(apiReturn.error == nil){
        data = TVDetailedMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data, apiReturn.json)
    }
  }
}
