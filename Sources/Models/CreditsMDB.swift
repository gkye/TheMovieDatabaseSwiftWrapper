//
//  CreditsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-07.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

public struct Credits_Episodes{
  public var air_date: String!
  public var episode_number: Int!
  public var overview: String!
  public var season_number: Int!
  public var still_path: String?
  public init(episodes: JSON){
    air_date = episodes["air_date"].string
    episode_number = episodes["episode_number"].int
    overview = episodes["overview"].string
    season_number = episodes["season_number"].int
    still_path = episodes["still_path"].string
  }
}
public struct Credits_Seasons{
  public var air_date: String!
  public var poster_path: String!
  public var season_number: Int!
  public init(seasons: JSON){
    air_date = seasons["air_date"].string
    poster_path = seasons["poster_path"].string
    season_number = seasons["season_number"].int
  }
}


public struct Credits_Media{
  public var id: Int!
  public var name: String!
  public var original_name: String!
  public var character: String!
  public var episodes = [Credits_Episodes]()
  public var seasons = [Credits_Seasons]()
  public init(media: JSON){
    id = media["id"].int
    name = media["name"].string
    original_name = media["original_name"].string
    character = media["character"].string
    
    if(media["episodes"].count > 0){
      for episode in media["episodes"]{
        episodes.append(Credits_Episodes.init(episodes: episode.1))
      }
    }
    
    if(media["seasons"].count > 0){
      seasons = media["seasons"].map{
        Credits_Seasons.init(seasons: $0.1)
      }
    }
  }
}

public struct CreditsMDB{
  
  public var credit_type: String!
  public var department: String!
  public var job: String!
  public var media: Credits_Media!
  public var media_Type: String!
  public var id: String!
  public var person: (name: String?, id: Int?)
  public init(credits: JSON){
    credit_type = credits["credit_type"].string
    department = credits["department"].string
    job = credits["job"].string
    
    media = Credits_Media.init(media: credits["media"])
    
    media_Type = credits["media_type"].string
    id = credits["id"].string
    person = (name: credits["person"]["name"].string, id: credits["person"]["id"].int)
  }
  
  /// Get the detailed information about a particular credit record. This is currently only supported with the new credit model found in TV. These ids can be found from any TV credit response as well as the tv_credits and combined_credits methods for people. The episodes object returns a list of episodes and are generally going to be guest stars. The season array will return a list of season numbers.
  public static func credits(_ apiKey: String, creditID: String, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: CreditsMDB?) -> ()) -> (){
    Client.Credits(apiKey, creditID: creditID, language: language){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn, CreditsMDB.init(credits: apiReturn.json!))
      }else{
        completion(apiReturn, nil)
      }
    }
  }
  
}
