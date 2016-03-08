//
//  SeasonsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-17.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class TVSeasonsMDB{
    
    var air_date: String!
    var episodes = [TVEpisodesMDB]()
    var name: String!
    var overview: String!
    var id: Int!
    var poster_path: String!
    var season_number: Int!
    
    init(results: JSON){
        air_date = results["air_date"].string
        episodes = TVEpisodesMDB.returnArrayOf(results["episodes"])
        name = results["name"].string
        overview = results["overview"].string
        id = results["id"].int
        poster_path = results["poster_path"].string
        season_number = results["season_number"].int
    }
    
    ///Get the primary information about a TV season by its season number.
    class func season_number(api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        //     [/tv/11/season/1]
        let urltype = "\(tvShowId)/season/\(seasonNumber)"
        Client.Seasons(urltype, api_key: apikey, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(apiReturn.error == nil){
                aReturn.MBDBReturn = TVSeasonsMDB(results: apiReturn.json!)
            }
            completion(aReturn)
        }
    }
   
    ///Get the cast & crew credits for a TV season by season number.
    class func credits(api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        //     [/tv/11/season/1/credits]
        let urltype = "\(tvShowId)/season/\(seasonNumber)/credits"
        Client.Seasons(urltype, api_key: apikey, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = CastCrewMDB.init(results: aReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the external ids that we have stored for a TV season by season number.
    class func externalIDS(api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String, completion: (ClientReturn) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/external_ids"
        Client.Seasons(urltype, api_key: apikey, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = ExternalIdsMDB.init(results: aReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the images (posters) that we have stored for a TV season by season number. **[backdrops] returned in ImagesMDB will be `nil`
    class func images(api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String, completion: (ClientReturn) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/images"
        Client.Seasons(urltype, api_key: apikey, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = ImagesMDB.init(results: apiReturn.json!)
            }

            completion(aReturn)
        }
    }
    
    ///Get the videos that have been added to a TV season (trailers, teasers, etc...)
    class func videos(api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String, completion: (ClientReturn) -> ()) -> (){
        //     [/tv/11/season/1/credits]
        let urltype = "\(tvShowId)/season/\(seasonNumber)/videos"
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