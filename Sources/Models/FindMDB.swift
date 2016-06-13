//
//  FindMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-09.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public enum ExternalIdTypes: String{
    
    case imdb_id;
    case freebase_mid;
    case freebase_id;
    case tvdb_id
    case tvrage_id
    case id
}

public class KnownForMovie: DiscoverMDB{
    public var original_title: String?
    public var release_date: String?
    public var title: String!
    public var video: Bool!
    public var media_type: String!

    required public init(results: JSON) {
        super.init(results: results)
        original_title = results["original_title"].string
        release_date = results["release_date"].string
        title = results["title"].string
        media_type = results["media_type"].string
    }
}

public class KnownForTV: DiscoverMDB{
    public var original_name: String?
    public var origin_country: [String]?
    public var first_air_date: String?
    public var name: String!
    public var media_type: String!

    required public init(results: JSON) {
        super.init(results: results)
        original_name = results["original_name"].string
        origin_country = results["origin_country"].arrayObject as? [String]
        first_air_date = results["first_air_date"].string
        name = results["name"].string
        media_type = results["media_type"].string
    }

}

public struct PersonResults: ArrayObject{
    public var adult: Bool!
    public var id: Int!
    public var known_for: (tvShows: [KnownForTV]?, movies: [KnownForMovie]?)
    public var name: String!
    public var popularity: Double?
    public var profile_path: String?
    
    init(results json: JSON){
        adult = json["adult"].bool
        id = json["id"].int
        name = json["name"].string
        popularity = json["popularity"].double
        profile_path = json["profile_path"].string
        var tvShows =  [KnownForTV]()
        var movies = [KnownForMovie]()
        
        for i in 0..<json["known_for"].count{
            if json["known_for"][i]["media_type"] == "tv"{
                tvShows.append(KnownForTV.init(results: json["known_for"][i]))
            }else{
                movies.append(KnownForMovie.init(results: json["known_for"][i]))
            }
        }
        known_for = (tvShows, movies)
    }
}

public struct FindMDB{
    
    /// MARK: FindMDB all results returned are optional (Most results will return one section only
    
    public var movie_results = [MovieMDB]()
    public var person_results: [PersonResults]?
    public var tv_results =  [TVMDB]()
    public var tv_episode_results = [TVEpisodesMDB]()
    public var tv_season_results =  [TVSeasonsMDB]()
    
    init(json: JSON){
        if(json["movie_results"] != nil){
            movie_results = MovieMDB.initialize(json: json["movie_results"])
        }
        
        if(json["tv_results"] != nil){
            tv_results = TVMDB.initialize(json: json["tv_results"])
        }
        if(json["person_results"] != nil){
            person_results = PersonResults.initialize(json: json["person_results"])
        }
        
        if(json["tv_episode_results"] != nil){
            tv_episode_results = TVEpisodesMDB.initialize(json: json["tv_episode_results"])
        }
        if(json["tv_season_results"] != nil){
            tv_season_results = TVSeasonsMDB.initialize(json: json["tv_seasons_results"])
        }
        
    }
    /**
     The find method makes it easy to search for objects in our database by an external id. For instance, an IMDB ID. This will search all objects (movies, TV shows and people) and return the results in a single response.
     */
    
    public static func find(apikey: String, id: String, external_source: ExternalIdTypes!,completion: (clientReturn: ClientReturn, data: FindMDB?) -> ()) -> (){
        
        Client.Find(apikey, external_id: id, external_source: external_source.rawValue){
            apiReturn in
            var data: FindMDB?
            if(apiReturn.error == nil){
                data = FindMDB.init(json: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
}