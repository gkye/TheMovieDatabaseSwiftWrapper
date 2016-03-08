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

extension MovieMDB{
    
  
    
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
    
    ///Get the alternative titles for a specific movie id.
    class func alternativeTitles(api_key: String!, movieID: Int!, country: String?, completion: (ClientReturn) -> ()) -> (){
        //language changed to country to avoid modifiying multiple defined functions.
        Client.Movies("\(movieID)/alternative_titles", api_key: api_key, page: nil, language: country){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = Alternative_TitlesMDB.init(results: apiReturn.json!)
            }
            completion(aReturn)
        }
    }
   
    ///Get the cast and crew information for a specific movie id.
    class func credits(api_key: String!, movieID: Int!, completion: (ClientReturn) -> ()) -> (){
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
    class func images(api_key: String!, movieID: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("\(movieID)/images", api_key: api_key, page: nil, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = ImagesMDB.init(results: apiReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the plot keywords for a specific movie id.
    class func keywords(api_key: String!, movieID: Int, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("\(movieID)/keywords", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = KeywordsMDB.initialize_(aReturn.json!["keywords"])
            }
            completion(aReturn)
        }
        
    }
    
    ///Get the release dates, certifications and related information by country for a specific movie id.
    class func release_dates(api_key: String!, movieID: Int, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("\(movieID)/release_dates", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = MovieReleaseDatesMDB.initialize(aReturn.json!["results"])
            }
            completion(aReturn)
        }
        
    }
    
    ///Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
    class func videos(api_key: String!, movieID: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("\(movieID)/videos", api_key: api_key, page: nil, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = VideosMDB.initialize(apiReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the translations for a specific movie id.
    class func translations(api_key: String!, movieID: Int!, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("\(movieID)/translations", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = TranslationsMDB.initialize(aReturn.json!["translations"])
            }
            completion(aReturn)
        }
        
    }
    
    ///Get the similar movies for a specific movie id.
    class func similar(api_key: String!, movieID: Int!, page: Int?, language: String?, completion: (ClientReturn) -> ()) -> (){
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
    
    ///Get the reviews for a particular movie id.
    class func reviews(api_key: String!, movieID: Int!, page: Int?, language: String, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("\(movieID)/reviews", api_key: api_key, page: page, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    aReturn.MBDBReturn = MovieReviewsMDB.initialize(aReturn.json!["results"])
                }
            }
            completion(aReturn)
        }
        
    }
    
    ///Get the lists that the movie belongs to.
    class func list(api_key: String!, movieID: Int!, page: Int?, language: String, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("\(movieID)/lists", api_key: api_key, page: page, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    aReturn.MBDBReturn = MovieListMDB.initialize(aReturn.json!["results"])
                }
            }
            completion(aReturn)
        }
        
    }
    ///Get the latest movie id.
    class func latest(api_key: String!, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("latest", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = MovieDetailedMDB.init(results: apiReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
    class func nowplaying(api_key: String!,language: String?, page: Int?, completion: (ClientReturn) -> ()) -> (){
        Client.Movies("now_playing", api_key: api_key, page: page, language: language){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = MovieMDB.initialize(apiReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the list of popular movies on The Movie Database. This list refreshes every day.
    class func popular(api_key: String!,language: String?, page: Int?, completion: (ClientReturn) -> ()) -> (){
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
    class func toprated(api_key: String!,language: String?, completion: (ClientReturn) -> ()) -> (){
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
    class func upcoming(api_key: String!,language: String?, completion: (ClientReturn) -> ()) -> (){
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
