//
//  FindMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-09.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON


enum ExternalIdTypes: String{
    
    case imdb_id;
    case freebase_mid;
    case freebase_id;
    case tvdb_id
    case tvrage_id
    case id
}

class FindMDB{
    
 /// MARK: FindMDB all results returned are optional (Most results will return one section only
    
    var movie_results = [MovieMDB]?()
   // var person_results = PersonMDB()
    var tv_results = [TVMDB]?()
    var tv_episode_results = [TVEpisodesMDB]?()
    var tv_season_results = [TVSeasonsMDB]?()
    
    init(find: JSON){
        if(find["movie_result"] != nil){
            movie_results = MovieMDB.initialize(find["movie_results"])
        }
        
        if(find["tv_results"] != nil){
            tv_results = TVMDB.initialize(find["tv_results"])
        }
        //FIX ME: Person result class
//        if(find["person_results"] = nil){
//            person_results = PersonMDB.init(person: <#T##JSON#>)
//        }
        if(find["tv_episode_results"] != nil){
            tv_episode_results = TVEpisodesMDB.returnArrayOf(find["tv_episode_results"])
        }
        if(find["tv_season_results"] != nil){
            tv_season_results = TVSeasonsMDB.initialize(find["tv_seasons_results"])
        }
        
    }
//  https://api.themoviedb.org/3/find/m/0kfv9?external_source=freebase_mid&api_key=8a7a49369d1af6a70ec5a6787bbfcf79
    class func find(apikey: String, id: String, external_source: ExternalIdTypes!,completion: (ClientReturn) -> ()) -> (){
        
        Client.Find(apikey, external_id: id, external_source: external_source.rawValue){
            apiReturn in
            var aReturn = apiReturn
            if(apiReturn.error == nil){
                aReturn.MBDBReturn = FindMDB.init(find: aReturn.json!)
            }
            completion(aReturn)
        }
    }
    
}