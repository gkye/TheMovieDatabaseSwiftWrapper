//
//  TVMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//
//TODO: - tanslations
//

import Foundation


extension TVMDB{
    
    ///Get the primary information about a TV series by id.
    public class func tv(api_key: String!, tvShowID: Int!, language: String?, completion: (clientReturn: ClientReturn, data: TVDetailedMDB?) -> ()) -> (){
        
        Client.TV("\(tvShowID)", api_key: api_key, page: nil, language: language, timezone: nil){
            apiReturn in
            var data: TVDetailedMDB?
            if(apiReturn.error == nil){
                data = TVDetailedMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the alternative titles for a specific show ID.
    public class func alternativeTitles(api_key: String!, tvShowID: Int!, completion: (clientReturn: ClientReturn, data: Alternative_TitlesMDB?) -> ()) -> (){
        Client.TV("\(tvShowID)/alternative_titles", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var data: Alternative_TitlesMDB?
            if(apiReturn.error == nil){
                data = Alternative_TitlesMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the content ratings for a specific TV show id.
  public class func content_ratings(api_key: String, tvShowID: Int,  completion: (clientReturn: ClientReturn, data: [Content_RatingsMDB]?) -> ()) -> (){
        Client.TV("\(tvShowID)/content_ratings", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var data: [Content_RatingsMDB]?
            if(apiReturn.error == nil){
                data = Content_RatingsMDB.initialize(json: apiReturn.json!["results"])
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the cast & crew information about a TV series. Just like the website, this information from the last season of the series.
   public class func credits(api_key: String!, tvShowID: Int!, completion: (clientResult: ClientReturn, data: TVCreditsMDB?) -> ()) -> (){
        Client.TV("\(tvShowID)/credits", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var data: TVCreditsMDB?
            if(apiReturn.error == nil){
                data =  TVCreditsMDB.init(results: apiReturn.json!)
            }
            completion(clientResult: apiReturn, data: data)
        }
    }
    
    //Get the external ids that we have stored for a TV series.
    public class func externalIDS(api_key: String!, tvShowID: Int!, language: String, completion: (clientResult: ClientReturn, data: ExternalIdsMDB?) -> ()) -> (){
        Client.TV("\(tvShowID)/external_ids", api_key: api_key, page: nil, language: language, timezone: nil){
            apiReturn in
            var data: ExternalIdsMDB?
            if(apiReturn.error == nil){
                data = ExternalIdsMDB.init(results: apiReturn.json!)
            }
            completion(clientResult: apiReturn, data: data)
        }
    }
    
    ///Get the images (posters and backdrops) for a TV series.
   public class func images(api_key: String!, tvShowID: Int!, language: String?, completion: (clientResult: ClientReturn, data: ImagesMDB?) -> ()) -> (){
        Client.TV("\(tvShowID)/images", api_key: api_key, page: nil, language: language, timezone: nil){
            apiReturn in
            var data: ImagesMDB?
            if(apiReturn.error == nil){
                data = ImagesMDB.init(results: apiReturn.json!)
            }
            completion(clientResult: apiReturn, data: data)
        }
    }
    
    ///Get the plot keywords for a specific TV show id.
   public class func keywords(api_key: String, tvShowID: Int!, completion: (clientResult: ClientReturn, data: [KeywordsMDB]?) -> ()) -> (){
        Client.TV("\(tvShowID)/keywords", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var data: [KeywordsMDB]?
            if(apiReturn.error == nil){
                data = KeywordsMDB.initialize(json: apiReturn.json!["results"])
            }
            completion(clientResult: apiReturn, data: data)
        }
    }
    
    ///Get the similar TV shows for a specific tv id.
   public  class func similar(api_key: String!, tvShowID: Int!, page: Int?, language: String?, completion: (clientResult: ClientReturn, data: [TVMDB]?) -> ()) -> (){
        Client.TV("\(tvShowID)/similar", api_key: api_key, page: page, language: language, timezone: nil){
            apiReturn in
            var data: [TVMDB]?
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    data = TVMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientResult: apiReturn, data: data)
        }
    }
    ///Get the list of translations that exist for a TV series. These translations cascade down to the episode level.
   public class func translations(api_key: String!, tvShowID: Int!, completion: (clientReturn: ClientReturn, data: [TranslationsMDB]?) -> ()) -> (){
        Client.TV("\(tvShowID)/translations", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var data: [TranslationsMDB]?
            if(apiReturn.error == nil){
                data = TranslationsMDB.initialize(json: apiReturn.json!["translations"])
            }
            completion(clientReturn: apiReturn, data: data)
        }
        
    }
    
    ///Get the videos that have been added to a TV series (trailers, opening credits, etc...)
   public class func videos(api_key: String!, tvShowID: Int!, language: String?, completion: (clientReturn: ClientReturn, data: [VideosMDB]?) -> ()) -> (){
        Client.TV("\(tvShowID)/videos", api_key: api_key, page: nil, language: language, timezone: nil){
            apiReturn in
            var data: [VideosMDB]?
            if(apiReturn.error == nil){
                data = VideosMDB.initialize(json: apiReturn.json!["results"])
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the latest TV show id.
   public class func latest(api_key: String!,  completion: (clientReturn: ClientReturn, data: TVDetailedMDB?) -> ()) -> (){
        Client.TV("latest", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var data: TVDetailedMDB?
            if(apiReturn.error == nil){
                data = TVDetailedMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the list of TV shows that are currently on the air. This query looks for any TV show that has an episode with an air date in the next 7 days.
   public class func ontheair(api_key: String!, page: Int?, language: String?, completion: (clientResult: ClientReturn, data: [TVMDB]?) -> ()) -> (){
        Client.TV("on_the_air", api_key: api_key, page: page, language: language, timezone: nil){
            apiReturn in
            var data: [TVMDB]?
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    data = TVMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientResult: apiReturn, data: data)
        }
    }
    
    ///Get the list of TV shows that air today. Without a specified timezone, this query defaults to EST (Eastern Time UTC-05:00).
   public  class func airingtoday(api_key: String!, page: Int?, language: String?, timezone: String?, completion: (clientResult: ClientReturn, data: [TVMDB]?) -> ()) -> (){
        Client.TV("airing_today", api_key: api_key, page: page, language: language, timezone: timezone){
            apiReturn in
            var data: [TVMDB]?
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    data = TVMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientResult: apiReturn, data: data)
        }
    }
    
    ///Get the list of top rated TV shows. By default, this list will only include TV shows that have 2 or more votes. This list refreshes every day.
   public class func toprated(api_key: String!, page: Int?, language: String?, completion: (clientResult: ClientReturn, data: [TVMDB]?) -> ()) -> (){
        Client.TV("top_rated", api_key: api_key, page: page, language: language, timezone: nil){
            apiReturn in
            var data: [TVMDB]?
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    data = TVMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientResult: apiReturn, data: data)
        }
    }
    
    ///Get the list of popular TV shows. This list refreshes every day.
   public class func popular(api_key: String!, page: Int?, language: String?, completion: (clientResult: ClientReturn, data: [TVMDB]?) -> ()) -> (){
        Client.TV("popular", api_key: api_key, page: page, language: language, timezone: nil){
            apiReturn in
            var data: [TVMDB]?
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    data = TVMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientResult: apiReturn, data: data)
        }
    }
}