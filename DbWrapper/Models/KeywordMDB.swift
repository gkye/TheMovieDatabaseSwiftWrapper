//
//  KeywordsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class KeywordMDB{
    
    var id: Int!
    var name: String!
    
    init(results: JSON){
        id = results["id"].int
        name = results["name"].string
    }
    
    ///Get the basic information for a specific keyword id.
    class func keyword(api_key: String!, keywordId: Int!, completion: (ClientReturn) -> ()) -> (){
        Client.keyword(api_key, keywordId: keywordId, page: nil, movies: false){
            apiReturn in
            completion(apiReturn)
        }
    }
    
    ///Get the plot keywords for a specific TV show id.
    class func tv_keywords(api_key: String!, tvShowID: Int!, completion: (ClientReturn) -> ()) -> (){
        Client.TV("\(tvShowID)/keywords", api_key: api_key, page: nil, language: nil, timezone: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                let count = aReturn.json!["results"].count;
                if(count > 0){
                    var keywordsArray = [KeywordMDB]()
                    for(var i = 0; i < count; i++ ){
                        keywordsArray.append(KeywordMDB.init(results: aReturn.json!["results"][i]))
                    }
                    aReturn.MBDBReturn = keywordsArray
                }
            }
            completion(aReturn)
        }
    }
    
}

class KeywordVC: UIViewController {
    
    override func viewDidLoad() {
        //        KeywordMDB.keyword(apikey, keywordId: 9708){
        //            apiReturn in
        //            let keyword = apiReturn.MBDBReturn as! KeywordMDB
        //            print(keyword.id)
        //            print(keyword.name)
        //        }
        
        //        DiscoverMovie.keyword(apikey, keywordId: 334, page: 2){
        //            apiReturn in
        //            var movie = apiReturn.MBDBReturn as! [MovieMDB]
        //            print(movie[0].title)
        //            print(movie[0].original_title)
        //            print(movie[0].release_date)
        //            print(movie[0].overview)
        //        }
        DiscoverMovie.genreList(apikey, genreId: 28, page: nil, include_all_movies: nil, include_adult: nil, movieList: nil){
            apiReturn in
            var movie = apiReturn.MBDBReturn as! [MovieMDB]
            print(movie[0].title)
            print(movie[0].original_title)
            print(movie[0].release_date)
            print(movie[0].overview)
        }
        //        GenresMDB.genres(apikey, listType: "tv", language: "en"){
        //            apiReturn in
        //            var gensList = apiReturn.MBDBReturn as! [GenresMDB]
        //           // print(apiReturn.json!["genres"][0]["id"])
        //            print(gensList[0].id)
        //            print(gensList[0].name)
        //
        //        }
        
        
    }
}