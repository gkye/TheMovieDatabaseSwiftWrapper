//
//  MoviesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//Sublass and inherit all related methods and variables here**
class MovieMDB:  DiscoverMovie {
    
    var adult: Bool!
    var title: String!
    var video: Bool!
    var release_date: String!
    var original_title: String!
    
    override init(results: JSON) {
        super.init(results: results)
        
        if(results["title"] != nil){
            title = results["title"].string
        }else{
            title = nil
        }
        
        if(results["video"] != nil){
            video = results["video"].bool
        }else{
            video = nil
        }
        
        if(results["adult"] != nil){
            adult = results["adult"].bool
        }else{
            adult = nil
        }
        
        if(results["release_date"] != nil){
            release_date = results["release_date"].string
        }else{
            release_date = nil
        }
        
        if(results["original_title"] != nil){
            original_title = results["original_title"].string
        }else{
            original_title = nil
        }
    }
    
    
    //Init function to return array of MovieMDB objs
    class func initialize(json: JSON)->[MovieMDB] {
        var discoverReturn = [MovieMDB]()
        for(var i = 0; i < json.count; i++){
            discoverReturn.append(MovieMDB(results: json[i]))
        }
        return discoverReturn
    }
    
    ///Get the basic movie information for a specific movie id.
    class func movie(api_key: String!, movieID: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("\(movieID)", api_key: api_key, page: nil, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = MovieDetailedMDB.init(results: apiReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the cast and crew information for a specific movie id.
    class func movie_credits(api_key: String!, movieID: Int!, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("\(movieID)/credits", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = CastCrewMDB.init(results: aReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the images (posters and backdrops) for a specific movie id.
    class func movie_images(api_key: String!, movieID: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("\(movieID)/images", api_key: api_key, page: nil, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = ImagesMDB.init(results: apiReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
    class func movie_videos(api_key: String!, movieID: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("\(movieID)/videos", api_key: api_key, page: nil, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = VideosMDB.initialize(apiReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the similar movies for a specific movie id.
    class func movie_similar(api_key: String!, movieID: Int!, page: Int?, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("\(movieID)/similar", api_key: api_key, page: page, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    aReturn.MBDBReturn = MovieMDB.initialize(apiReturn.json!["results"])
                }
            }
            completion(aReturn)
        }
    }
    ///Get the latest movie id.
    class func movies_latest(api_key: String!, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("latest", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = MovieMDB.initialize(apiReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
    class func movies_nowplaying(api_key: String!,language: String?, page: Int?, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("nowplaying", api_key: api_key, page: page, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = MovieMDB.initialize(apiReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the list of popular movies on The Movie Database. This list refreshes every day.
    class func movies_popular(api_key: String!,language: String?, page: Int?, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("popular", api_key: api_key, page: page, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = MovieMDB.initialize(apiReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the list of top rated movies. By default, this list will only include movies that have 50 or more votes. This list refreshes every day.
    class func movies_toprated(api_key: String!,language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("top_rated", api_key: api_key, page: nil, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = MovieMDB.initialize(apiReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the list of upcoming movies by release date. This list refreshes every day.
    class func movies_upcoming(api_key: String!,language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("top_rated", api_key: api_key, page: nil, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = MovieMDB.initialize(apiReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    
    
    
    
}
