//
//  KeywordsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation


open class KeywordsMDB: ArrayObject{
  
  open var id: Int?
  open var name: String?
  
  required public init(results: JSON){
    id = results["id"].int
    name = results["name"].string
  }
  
  ///Get the basic information for a specific keyword id.
  open class func keyword(_ api_key: String!, keywordId: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: KeywordsMDB?) -> ()) -> (){
    let url = "https://api.themoviedb.org/3/keyword/" + String(keywordId)
    Client.keyword(url, api_key: api_key){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn, KeywordsMDB.init(results: apiReturn.json!))
      }else{
        completion(apiReturn, nil)
      }
    }
  }
  
  ///Get the list of movies for a particular keyword by id.
  open class func keyword_movies(_ api_key: String!, keywordId: Int!, page: Int, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> ()) -> (){
    let url = "https://api.themoviedb.org/3/keyword/" + String(keywordId) + "/movies"
    Client.keyword_movies(url, api_key: api_key, page: page, language: language){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn, MovieMDB.initialize(json: apiReturn.json!["results"]))
      }else{
        completion(apiReturn, nil)
      }
    }
  }
  
}
