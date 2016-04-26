//
//  KeywordsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public class KeywordsMDB{
    
    public var id: Int?
    public var name: String?
    
    init(results: JSON){
        id = results["id"].int
        name = results["name"].string
    }
    
    //Init function to return array of KeywordsMDB objs
   class func initialize_(json: JSON)->[KeywordsMDB] {
        var keywordsArray = [KeywordsMDB]()
        for i in 0..<json.count{
            keywordsArray.append(KeywordsMDB(results: json[i]))
        }
        return keywordsArray
    }
    
    ///Get the basic information for a specific keyword id.
   public class func keyword(api_key: String!, keywordId: Int!, completion: (clientReturn: ClientReturn, data: KeywordsMDB?) -> ()) -> (){
        let url = "http://api.themoviedb.org/3/keyword/\(keywordId)"
        Client.keyword(url, api_key: api_key){
            apiReturn in
            if(apiReturn.error == nil){
                completion(clientReturn: apiReturn, data: KeywordsMDB.init(results: apiReturn.json!))
            }else{
                completion(clientReturn: apiReturn, data: nil)
            }
        }
    }
    
    ///Get the list of movies for a particular keyword by id.
   public class func keyword_movies(api_key: String!, keywordId: Int!, page: Int, language: String?, completion: (clientReturn: ClientReturn, data: [MovieMDB]?) -> ()) -> (){
        let url = "http://api.themoviedb.org/3/keyword/\(keywordId)/movies"
        Client.keyword_movies(url, api_key: api_key, page: page, language: language){
            apiReturn in
            if(apiReturn.error == nil){
                completion(clientReturn: apiReturn, data: MovieMDB.initialize(apiReturn.json!["results"]))
            }else{
                completion(clientReturn: apiReturn, data: nil)
            }
        }
    }
    
}
