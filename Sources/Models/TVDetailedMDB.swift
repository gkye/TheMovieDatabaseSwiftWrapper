//
//  TVDetailedMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation


public struct tv_created_By{
  public var id: Int!
  public var name: String!
  public var profile_path: String!
}

public struct tv_seasons{
  public var air_date: String?
  public var episode_count: Int!
  public var id: Int!
  public var poster_path: String!
  public var season_number: Int!
  
  init(results: JSON){
    if(results["air_date"].exists()){
      air_date = results["air_date"].string
    }else{
      air_date = "";
    }
    episode_count = results["episode_count"].int
    id = results["id"].int
    
    if(results["poster_path"].exists()){
      poster_path = results["poster_path"].string
    }else{
      poster_path = "";
    }
    season_number = results["season_number"].int
  }
  
}

open class TVDetailedMDB: TVMDB{
  open var createdBy: tv_created_By?
  open var episode_run_time: [Int]!
  open var homepage: String?
  open var in_production: Bool?
  open var languages: [String]?
  open var last_air_date: String!
  open var networks = [KeywordsMDB]()
  open var number_of_episodes: Int!
  open var number_of_seasons: Int!
  open var production_companies = [KeywordsMDB]()
  open var seasons = [tv_seasons]()
  open var status: String!
  open var type: String!
  
  required public init(results: JSON) {
    super.init(results: results)
    if(results["created_by"].count > 0 && results["created_by"][0].exists()){
      createdBy = tv_created_By.init(id: results["created_by"][0]["id"].int, name: results["created_by"][0]["name"].string, profile_path: results["created_by"][0]["profile_path"].string)
    }
    
    episode_run_time = results["episode_run_time"].arrayObject as! [Int]
    //        genres = KeywordsMDB.init(results: results["genres"])
    homepage = results["homepage"].string
    in_production = results["in_production"].bool
    languages = results["languages"].arrayObject as? [String]
    
    if(results["last_air_date"].exists()){
      last_air_date = results["last_air_date"].string
    }else{
      last_air_date = ""
    }
    
    if(results["networks"].exists()){
      networks = results["networks"].map{
        KeywordsMDB.init(results: $0.1)
      }
    }

    number_of_episodes = results["number_of_episodes"].int
    number_of_seasons = results["number_of_seasons"].int
    
    if(results["production_companies"].exists()){
      production_companies = results["production_companies"].map{
        KeywordsMDB.init(results: $0.1)
      }
    }
    
    seasons = results["seasons"].map{
      tv_seasons.init(results: $0.1)
    }
    
    status = results["status"].string
    type = results["type"].string
  }
  
}
