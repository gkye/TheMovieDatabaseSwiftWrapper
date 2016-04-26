//
//  SeasonsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-17.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

public class TVSeasonsMDB{
    
    public var air_date: String!
    public var episodes = [TVEpisodesMDB]()
    public var name: String!
    public var overview: String!
    public var id: Int!
    public var poster_path: String!
    public var season_number: Int!
    
    init(results: JSON){
        air_date = results["air_date"].string
        episodes = TVEpisodesMDB.returnArrayOf(results["episodes"])
        name = results["name"].string
        overview = results["overview"].string
        id = results["id"].int
        poster_path = results["poster_path"].string
        season_number = results["season_number"].int
    }
    
    class func initialize(json: JSON)->[TVSeasonsMDB] {
        var tvSeasonsArray = [TVSeasonsMDB]()
        for i in 0..<json.count {
            tvSeasonsArray.append(TVSeasonsMDB(results: json[i]))
        }
        return tvSeasonsArray
    }
    
    ///Get the primary information about a TV season by its season number.
    public class func season_number(api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String?, completion: (clientReturn: ClientReturn, data: TVSeasonsMDB?) -> ()) -> (){
        //     [/tv/11/season/1]
        let urltype = "\(tvShowId)/season/\(seasonNumber)"
        Client.Seasons(urltype, api_key: api_key, language: language){
            apiReturn in
            var data: TVSeasonsMDB?
            if(apiReturn.error == nil){
                data = TVSeasonsMDB(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the cast & crew credits for a TV season by season number.
    public class func credits(api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String?, completion: (clientReturn: ClientReturn, data: TVCreditsMDB?) -> ()) -> (){
        //     [/tv/11/season/1/credits]
        let urltype = "\(tvShowId)/season/\(seasonNumber)/credits"
        Client.Seasons(urltype, api_key: api_key, language: language){
            apiReturn in
            var data: TVCreditsMDB?
            if(apiReturn.error == nil){
                data = TVCreditsMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the external ids that we have stored for a TV season by season number.
    public class func externalIDS(api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String, completion: (clientReturn: ClientReturn, data: ExternalIdsMDB?) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/external_ids"
        Client.Seasons(urltype, api_key: api_key, language: language){
            apiReturn in
            var data: ExternalIdsMDB?
            if(apiReturn.error == nil){
                data = ExternalIdsMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the images (posters) that we have stored for a TV season by season number. **[backdrops] returned in ImagesMDB will be `nil`
    public class func images(api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String, completion: (clientReturn: ClientReturn, data: ImagesMDB?) -> ()) -> (){
        let urltype = "\(tvShowId)/season/\(seasonNumber)/images"
        Client.Seasons(urltype, api_key: api_key, language: language){
            apiReturn in
            var data: ImagesMDB?
            if(apiReturn.error == nil){
                data = ImagesMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the videos that have been added to a TV season (trailers, teasers, etc...)
    public class func videos(api_key: String, tvShowId: Int!, seasonNumber: Int!, language: String, completion: (clientReturn: ClientReturn, data: [VideosMDB]?)-> ()) -> (){
        //     [/tv/11/season/1/credits]
        let urltype = "\(tvShowId)/season/\(seasonNumber)/videos"
        Client.Seasons(urltype, api_key: api_key, language: language){
            apiReturn in
            var data: [VideosMDB]?
            if(apiReturn.error == nil){
                data = VideosMDB.initialize(apiReturn.json!["results"])
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
}