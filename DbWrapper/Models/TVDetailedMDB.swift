//
//  TVDetailedMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

struct tv_created_By{
    var id: Int!
    var name: String!
    var profile_path: String!
}
struct tv_seasons{
    var air_date: String!
    var episode_count: Int!
    var id: Int!
    var poster_path: String!
    var season_number: Int!
    
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

class TVDetailedMDB: TVMDB{
    var createdBy: tv_created_By?
    var episode_run_time: [Int]!
    var genres: KeywordsMDB!
    var homepage: String?
    var in_production: Bool?
    var languages: [String]?
    var last_air_date: String!
    var networks: KeywordsMDB!
    var number_of_episodes: Int!
    var number_of_seasons: Int!
    var production_companies = [KeywordsMDB]()
    var seasons = [tv_seasons]()
    var status: String!
    var type: String!
    
    override init(results: JSON) {
        super.init(results: results)
        if(results["created_by"].count > 0 && results["created_by"][0] != nil ){
            createdBy = tv_created_By.init(id: results["created_by"][0]["id"].int, name: results["created_by"][0]["name"].string, profile_path: results["created_by"][0]["profile_path"].string)
        }
        
        episode_run_time = results["episode_run_time"].arrayObject as! [Int]
        genres = KeywordsMDB.init(results: results["genres"])
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
            for(var i = 0; i < results["production_companies"].count; i++ ){
                production_companies.append(KeywordsMDB.init(results: results["networks"][i]))
            }
        }
        
        for(var i = 0; i < results["seasons"].count; i++){
            seasons.append(tv_seasons.init(results: results["seasons"][i]))
        }
        
        status = results["status"].string
        type = results["type"].string
    }
    
}
