//
//  KeywordsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON



class KeywordsMDB{
    
    var id: Int!
    var name: String!
    
    init(results: JSON){
        id = results["id"].int
        name = results["name"].string
    }
    
    //Init function to return array of KeywordsMDB objs
   class func initialize_(json: JSON)->[KeywordsMDB] {
        var keywordsArray = [KeywordsMDB]()
        for(var i = 0; i < json.count; i++){
            keywordsArray.append(KeywordsMDB(results: json[i]))
        }
        return keywordsArray
    }
    
    ///Get the basic information for a specific keyword id.
    class func keyword(api_key: String!, keywordId: Int!, completion: (ClientReturn) -> ()) -> (){
        let url = "https://api.themoviedb.org/3/keyword/\(keywordId)"
        Client.keyword(url, api_key: apikey){
            apiReturn in
            var aReturn = apiReturn;
            if(aReturn.error == nil){
                aReturn.MBDBReturn = KeywordsMDB.init(results: aReturn.json!)
            }
            completion(aReturn)
        }
    
    }
    
    ///Get the list of movies for a particular keyword by id.
    class func keyword_movies(api_key: String!, keywordId: Int!, page: Int, language: String?, completion: (ClientReturn) -> ()) -> (){
        let url = "https://api.themoviedb.org/3/keyword/\(keywordId)/movies"
        Client.keyword_movies(url, api_key: apikey, page: page, language: language){
        apiReturn in
            var aReturn = apiReturn;
            if(aReturn.error == nil){
                aReturn.MBDBReturn = MovieMDB.initialize(aReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
    
    
    
}

class KeywordVC: UIViewController {
    
    override func viewDidLoad() {
        //        KeywordsMDB.keyword(apikey, keywordId: 9708){
        //            apiReturn in
        //            let keyword = apiReturn.MBDBReturn as! KeywordsMDB
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
        DiscoverMovieMDB.genreList(apikey, genreId: 28, page: nil, include_all_movies: nil, include_adult: nil, movieList: nil){
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