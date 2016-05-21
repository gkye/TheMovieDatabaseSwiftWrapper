//
//  TVDetailedMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
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
        if(results["air_date"] != nil){
            air_date = results["air_date"].string
        }else{
            air_date = "";
        }
        episode_count = results["episode_count"].int
        id = results["episode_count"].int
        
        if(results["poster_path"] != nil){
            poster_path = results["poster_path"].string
        }else{
            poster_path = "";
        }
        season_number = results["episode_count"].int
    }
    
}

public class TVDetailedMDB: TVMDB{
    public var createdBy: tv_created_By?
    public var episode_run_time: [Int]!
    public var homepage: String?
    public var in_production: Bool?
    public var languages: [String]?
    public var last_air_date: String!
    public var networks: KeywordsMDB!
    public var number_of_episodes: Int!
    public var number_of_seasons: Int!
    public var production_companies = [KeywordsMDB]()
    public var seasons = [tv_seasons]()
    public var status: String!
    public var type: String!
    
    required public init(results: JSON) {
        super.init(results: results)
        if(results["created_by"].count > 0 && results["created_by"][0] != nil ){
            createdBy = tv_created_By.init(id: results["created_by"][0]["id"].int, name: results["created_by"][0]["name"].string, profile_path: results["created_by"][0]["profile_path"].string)
        }
        
        episode_run_time = results["episode_run_time"].arrayObject as! [Int]
//        genres = KeywordsMDB.init(results: results["genres"])
        homepage = results["homepage"].string
        in_production = results["in_production"].bool
        languages = results["languages"].arrayObject as? [String]
        
        if(results["last_air_date"] != nil){
            last_air_date = results["last_air_date"].string
        }else{
            last_air_date = ""
        }
        
        networks = KeywordsMDB.init(results: results["networks"])
        number_of_episodes = results["number_of_episodes"].int
        number_of_seasons = results["number_of_episodes"].int
        
        if(results["production_companies"] != nil){
            for i in 0...results["production_companies"].count{
                production_companies.append(KeywordsMDB.init(results: results["networks"][i]))
            }
        }
        
        for i in 0...results["seasons"].count{
            seasons.append(tv_seasons.init(results: results["seasons"][i]))
        }
        
        status = results["status"].string
        type = results["type"].string
    }
    
}
