//
//  SeasonsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George Kye. All rights reserved.
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
  public static func season_number(tvShowId: Int!, seasonNumber: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVSeasonsMDB?) -> ()) -> (){
    
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber)
    Client.Seasons(urltype,  language: language){
      apiReturn in
      var data: TVSeasonsMDB?
      if let json = apiReturn.json {
        data = TVSeasonsMDB(results: json)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the cast & crew credits for a TV season by season number.
  public static func credits(tvShowId: Int!, seasonNumber: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVCreditsMDB?) -> ()) -> (){
    //     [/tv/11/season/1/credits]
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/credits"
    Client.Seasons(urltype,  language: language){
      apiReturn in
      var data: TVCreditsMDB?
      if let json = apiReturn.json {
        data = TVCreditsMDB.init(results: json)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the external ids that we have stored for a TV season by season number.
  public static func externalIDS(tvShowId: Int!, seasonNumber: Int!, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: ExternalIdsMDB?) -> ()) -> (){
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/external_ids"
    Client.Seasons(urltype,  language: language){
      apiReturn in
      var data: ExternalIdsMDB?
      if let json = apiReturn.json {
        data = ExternalIdsMDB.init(results: json)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the images (posters) that we have stored for a TV season by season number. **[backdrops] returned in ImagesMDB will be `nil`
  public static func images(tvShowId: Int!, seasonNumber: Int!, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: ImagesMDB?) -> ()) -> (){
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/images"
    Client.Seasons(urltype,  language: language){
      apiReturn in
      var data: ImagesMDB?
      if let json = apiReturn.json {
        data = ImagesMDB.init(results: json)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the videos that have been added to a TV season (trailers, teasers, etc...)
  public static func videos(tvShowId: Int!, seasonNumber: Int!, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: [VideosMDB]?)-> ()) -> (){
    //     [/tv/11/season/1/credits]
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/videos"
    Client.Seasons(urltype,  language: language){
      apiReturn in
      var results: [VideosMDB]?
      if let data = apiReturn.data,
        let decodedWrapper = try? JSONDecoder().decode(ResultsWrapper<VideosMDB>.self, from: data) {

        results = decodedWrapper.results
      }
      completion(apiReturn, results)
    }
  }
}
