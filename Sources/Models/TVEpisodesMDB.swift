//
//  EpisodesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

public struct TVEpisodesMDB: ArrayObject {
  
  public var air_date: String!
  public var crew = [CrewMDB]()
  public var guest_stars = [TVCastMDB]()
  public var number: Int!
  public var name: String!
  public var overview: String!
  public var id: Int!
  public var production_code: Int!
  public var season_number: Int!
  public var still_path: String!
  public var vote_average: Int!
  public var vote_count: Int!
  
  public init(results: JSON){
    air_date = results["air_date"].string
    
    if(results["crew"].exists()){
      for i in 0...results["crew"].count{
        crew.append(CrewMDB.init(crew: results["crew"][i]))
      }
    }
    number = results["number"].int
    
    if(results["guest_stars"].exists()){
      for i in 0 ..< results["guest_stars"].count {
        guest_stars.append(TVCastMDB.init(cast: results["guest_stars"][i]))
      }
    }
    name = results["name"].string
    overview = results["overview"].string
    id = results["id"].int
    production_code = results["production_code"].int
    season_number = results["season_number"].int
    still_path = results["still_path"].string
    vote_average = results["vote_average"].int
    vote_count  = results[" vote_count"].int
  }
  
  
  ///Get the primary information about a TV episode by combination of a season and episode number.
  public static func episode_number(_ api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVEpisodesMDB) -> ()) -> (){
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/episode/" + String(episodeNumber)
    Client.Seasons(urltype, api_key: api_key, language: language){
      apiReturn in
      completion(apiReturn, TVEpisodesMDB(results: apiReturn.json!))
      
    }
  }
  
  ///Get the TV episode credits by combination of season and episode number.
  public static func credits(_ api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVCreditsMDB?) -> ()) -> (){
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/episode/" + String(episodeNumber) + "/credits"
    Client.Seasons(urltype, api_key: api_key, language: nil){
      apiReturn in
      var data: TVCreditsMDB?
      if(apiReturn.error == nil){
        data = TVCreditsMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the external ids for a TV episode by comabination of a season and episode number.
  public static func externalIDS(_ api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: ExternalIdsMDB?) -> ()) -> (){
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/episode/" + String(episodeNumber) + "/external_ids"
    Client.Seasons(urltype, api_key: api_key, language: language){
      apiReturn in
      var data: ExternalIdsMDB?
      if(apiReturn.error == nil){
        data = ExternalIdsMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the images (episode stills) for a TV episode by combination of a season and episode number. Since episode stills don't have a language, this call will always return all images. **ONLY `stills` retuned from ImagesMDB (`posters` & `backdrops` will be empty)**
  public static func images(_ api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: ImagesMDB?) -> ()) -> (){
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/episode/" + String(episodeNumber) + "/images"
    Client.Seasons(urltype, api_key: api_key, language: nil){
      apiReturn in
      var data: ImagesMDB?
      if(apiReturn.error == nil){
        data = ImagesMDB.init(results: apiReturn.json!)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the videos that have been added to a TV episode (teasers, clips, etc...)
  public static func videos(_ api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [VideosMDB]?) -> ()) -> (){
    let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/episode/" + String(episodeNumber) + "/videos"
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
