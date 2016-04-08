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
    //MARK: public functions
    
    ///Get the primary information about a TV series by id.
    class func tv(api_key: String!, tvShowID: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        
        Client.TV("\(tvShowID)", api_key: api_key, page: nil, language: language, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = TVDetailedMDB.init(results: apiReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the alternative titles for a specific show ID.
    class func alternativeTitles(api_key: String!, tvShowID: Int!, completion: (ClientReturn) -> ()) -> (){
        Client.TV("\(tvShowID)/alternative_titles", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = Alternative_TitlesMDB.init(results: apiReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the content ratings for a specific TV show id.
    class func content_ratings(api_key: String, tvShowID: Int,  completion: (ClientReturn) -> ()) -> (){
        Client.TV("\(tvShowID)/content_ratings", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = Content_RatingsMDB.initialize(aReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the cast & crew information about a TV series. Just like the website, this information from the last season of the series.
    class func credits(api_key: String!, tvShowID: Int!, completion: (ClientReturn) -> ()) -> (){
        Client.TV("\(tvShowID)/credits", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn =  TVCreditsMDB.init(results: aReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    //Get the external ids that we have stored for a TV series.
    class func externalIDS(api_key: String!, tvShowID: Int!, language: String, completion: (ClientReturn) -> ()) -> (){
        Client.TV("\(tvShowID)/external_ids", api_key: api_key, page: nil, language: language, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = ExternalIdsMDB.init(results: aReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the images (posters and backdrops) for a TV series.
    class func images(api_key: String!, tvShowID: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.TV("\(tvShowID)/images", api_key: api_key, page: nil, language: language, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = ImagesMDB.init(results: apiReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the plot keywords for a specific TV show id.
    class func keywords(api_key: String, tvShowID: Int!, completion: (ClientReturn) -> ()) -> (){
        Client.TV("\(tvShowID)/keywords", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = KeywordsMDB.initialize_(aReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the similar TV shows for a specific tv id.
    class func similar(api_key: String!, tvShowID: Int!, page: Int?, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.TV("\(tvShowID)/similar", api_key: api_key, page: page, language: language, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    aReturn.MBDBReturn = TVMDB.initialize(apiReturn.json!["results"])
                }
            }
            completion(aReturn)
        }
    }
    ///Get the list of translations that exist for a TV series. These translations cascade down to the episode level.
    class func translations(api_key: String!, tvShowID: Int!, completion: (ClientReturn) -> ()) -> (){
        Client.TV("\(tvShowID)/translations", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = TranslationsMDB.initialize(aReturn.json!["translations"])
            }
            completion(aReturn)
        }
        
    }
    
    ///Get the videos that have been added to a TV series (trailers, opening credits, etc...)
    class func videos(api_key: String!, tvShowID: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.TV("\(tvShowID)/videos", api_key: api_key, page: nil, language: language, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = VideosMDB.initialize(apiReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the latest TV show id.
    class func latest(api_key: String!,  completion: (ClientReturn) -> ()) -> (){
        Client.TV("latest", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = TVDetailedMDB.init(results: apiReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the list of TV shows that are currently on the air. This query looks for any TV show that has an episode with an air date in the next 7 days.
    class func ontheair(api_key: String!, page: Int?, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.TV("on_the_air", api_key: api_key, page: page, language: language, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = TVMDB.initialize(aReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the list of TV shows that air today. Without a specified timezone, this query defaults to EST (Eastern Time UTC-05:00).
    class func airingtoday(api_key: String!, page: Int?, language: String?, timezone: String?, completion: (ClientReturn) -> ()) -> (){
        Client.TV("airing_today", api_key: api_key, page: page, language: language, timezone: timezone){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = TVMDB.initialize(aReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the list of top rated TV shows. By default, this list will only include TV shows that have 2 or more votes. This list refreshes every day.
    class func toprated(api_key: String!, page: Int?, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.TV("top_rated", api_key: api_key, page: page, language: language, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = TVMDB.initialize(aReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the list of popular TV shows. This list refreshes every day.
    class func popular(api_key: String!, page: Int?, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.TV("popular", api_key: api_key, page: page, language: language, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = TVMDB.initialize(aReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
}