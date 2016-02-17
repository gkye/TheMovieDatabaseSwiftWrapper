//
//  EpisodesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-17.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON


class TVEpisodesMDB {
    
    var air_date: String!
    var crew = [CrewMDB]()
    var guest_stars = [CastMDB]()
    var episode_number: Int!
    var name: String!
    var overview: String!
    var id: Int!
    var production_code: Int!
    var season_number: Int!
    var still_path: String!
    var vote_average: Int!
    var vote_count: Int!
    
    init(results: JSON){
        air_date = results["air_date"].string
        
        if(results["crew"] != nil){
            for(var i = 0; i < results["crew"].count; i++ ){
                crew.append(CrewMDB.init(results: results["crew"][i]))
            }
        }
        
        episode_number = results["episode_number"].int
        
        if(results["guest_stars"] != nil){
            for(var i = 0; i < results["guest_stars"].count; i++ ){
                guest_stars.append(CastMDB.init(results: results["guest_stars"][i]))
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
    class func returnArrayOf(json: JSON) -> [TVEpisodesMDB] {
        var changes = [TVEpisodesMDB]()
        for(var i = 0; i < json.count; i++){
            changes.append(TVEpisodesMDB(results: json[i]))
        }
        return changes
    }
    
    ///Get the primary information about a TV episode by combination of a season and episode number.
    class func episode_number(api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/episode/\(episodeNumber)"
        Client.Seasons(urltype, api_key: apikey, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(apiReturn.error == nil){
                aReturn.MBDBReturn = TVEpisodesMDB(results: apiReturn.json!)
            }
            completion(aReturn)
            
        }
    }
    
    ///Get the TV episode credits by combination of season and episode number.
    class func episode_credits(api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, completion: (ClientReturn) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/episode/\(episodeNumber)/credits"
        Client.Seasons(urltype, api_key: apikey, language: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = CastCrewMDB.init(results: aReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the images (episode stills) for a TV episode by combination of a season and episode number. Since episode stills don't have a language, this call will always return all images. **ONLY `stills` retuned from ImagesMDB (`posters` & `backdrops` will be empty)**
    class func episode_images(api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, completion: (ClientReturn) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/episode/\(episodeNumber)/images"
        Client.Seasons(urltype, api_key: apikey, language: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = ImagesMDB.init(results: apiReturn.json!)
            }
            
            completion(aReturn)
        }
    }
    
    class func episode_videos(api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/episode/\(episodeNumber)/videos"
        Client.Seasons(urltype, api_key: apikey, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = VideosMDB.initialize(apiReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    
    
    
    
    
}