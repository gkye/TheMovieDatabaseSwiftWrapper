//
//  EpisodesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-17.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation



public  class TVEpisodesMDB: ArrayObject {
    
    var air_date: String!
    var crew = [CrewMDB]()
    var guest_stars = [TVCastMDB]()
    var number: Int!
    var name: String!
    var overview: String!
    var id: Int!
    var production_code: Int!
    var season_number: Int!
    var still_path: String!
    var vote_average: Int!
    var vote_count: Int!
    
    required public init(results: JSON){
        air_date = results["air_date"].string
        
        if(results["crew"] != nil){
            for i in 0...results["crew"].count{
                crew.append(CrewMDB.init(crew: results["crew"][i]))
            }
        }
        number = results["number"].int
        
        if(results["guest_stars"] != nil){
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
    class func episode_number(api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, language: String?, completion: (clientReturn: ClientReturn, data: TVEpisodesMDB) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/episode/\(episodeNumber)"
        Client.Seasons(urltype, api_key: api_key, language: language){
            apiReturn in            
            completion(clientReturn: apiReturn, data: TVEpisodesMDB(results: apiReturn.json!))
            
        }
    }
    
    ///Get the TV episode credits by combination of season and episode number.
    class func credits(api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, completion: (clientReturn: ClientReturn, data: TVCreditsMDB?) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/episode/\(episodeNumber)/credits"
        Client.Seasons(urltype, api_key: api_key, language: nil){
            apiReturn in
            var data: TVCreditsMDB?
            if(apiReturn.error == nil){
                data = TVCreditsMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the external ids for a TV episode by comabination of a season and episode number.
    class func externalIDS(api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int, language: String, completion: (clientReturn: ClientReturn, data: ExternalIdsMDB?) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/episode/\(episodeNumber)/external_ids"
        Client.Seasons(urltype, api_key: api_key, language: language){
            apiReturn in
            var data: ExternalIdsMDB?
            if(apiReturn.error == nil){
                data = ExternalIdsMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the images (episode stills) for a TV episode by combination of a season and episode number. Since episode stills don't have a language, this call will always return all images. **ONLY `stills` retuned from ImagesMDB (`posters` & `backdrops` will be empty)**
    class func images(api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, completion: (clientReturn: ClientReturn, data: ImagesMDB?) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/episode/\(episodeNumber)/images"
        Client.Seasons(urltype, api_key: api_key, language: nil){
            apiReturn in
            var data: ImagesMDB?
            if(apiReturn.error == nil){
                data = ImagesMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the videos that have been added to a TV episode (teasers, clips, etc...)
    class func videos(api_key: String, tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, language: String?, completion: (clientReturn: ClientReturn, data: [VideosMDB]?) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/episode/\(episodeNumber)/videos"
        Client.Seasons(urltype, api_key: api_key, language: language){
            apiReturn in
            var data: [VideosMDB]?
            if(apiReturn.error == nil){
                data = VideosMDB.initialize(json: apiReturn.json!["results"])
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
}