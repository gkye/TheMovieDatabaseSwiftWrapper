//
//  SeasonsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

public struct TVSeasonsMDB: ArrayObject{
  
  public var air_date: String!
  public var episodes = [TVEpisodesMDB]()
  public var name: String!
  public var overview: String!
  public var id: Int!
  public var poster_path: String!
  public var season_number: Int!
  
  public init(results: JSON){
    air_date = results["air_date"].string
    episodes = TVEpisodesMDB.initialize(json: results["episodes"])
    name = results["name"].string
    overview = results["overview"].string
    id = results["id"].int
    poster_path = results["poster_path"].string
    season_number = results["season_number"].int
  }
  
  ///Get the primary information about a TV season by its season number.
  public static func season_number(_ api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVSeasonsMDB?) -> ()) -> (){

    let urltype = String(tvShowId) + "/season/" + String(seasonNumber)
    Client.Seasons(urltype, api_key: api_key, language: language){
      apiReturn in
      var data: TVSeasonsMDB?
      if(apiReturn.error == nil){
        data = TVSeasonsMDB(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the cast & crew credits for a TV season by season number.
  public static func credits(_ api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVCreditsMDB?) -> ()) -> (){
    //     [/tv/11/season/1/credits]
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/credits"
    Client.Seasons(urltype, api_key: api_key, language: language){
      apiReturn in
      var data: TVCreditsMDB?
      if(apiReturn.error == nil){
        data = TVCreditsMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the external ids that we have stored for a TV season by season number.
  public static func externalIDS(_ api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: ExternalIdsMDB?) -> ()) -> (){
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/external_ids"
    Client.Seasons(urltype, api_key: api_key, language: language){
      apiReturn in
      var data: ExternalIdsMDB?
      if(apiReturn.error == nil){
        data = ExternalIdsMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the images (posters) that we have stored for a TV season by season number. **[backdrops] returned in ImagesMDB will be `nil`
  public static func images(_ api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: ImagesMDB?) -> ()) -> (){
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/images"
    Client.Seasons(urltype, api_key: api_key, language: language){
      apiReturn in
      var data: ImagesMDB?
      if(apiReturn.error == nil){
        data = ImagesMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the videos that have been added to a TV season (trailers, teasers, etc...)
  public static func videos(_ api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: [VideosMDB]?)-> ()) -> (){
    //     [/tv/11/season/1/credits]
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/videos"
    Client.Seasons(urltype, api_key: api_key, language: language){
      apiReturn in
      var data: [VideosMDB]?
      if(apiReturn.error == nil){
        data = VideosMDB.initialize(json: apiReturn.json!["results"])
      }
      completion(apiReturn, data)
    }
  }
  
}
