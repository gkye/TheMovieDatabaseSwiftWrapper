//
//  Collection.swift
//  TheMovieDBWrapperSwift
//
//  Created by George Kye on 2016-02-08.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation


//** CHECK LISt-> may contain collection or tv object.

public struct CollectionMDB: ArrayObject{
  
  public var id: Int?
  public var name: String?
  public var poster_path: String?
  public var backdrop_path: String?
  public var overview: String?
  public var collectionItems = [MovieMDB]()
  
  public init(results: JSON) {
    
    collectionItems = results["parts"].map{
      MovieMDB(results: $0.1)
    }
    
    id = results["id"].int
    name = results["name"].string
    poster_path = results["poster_path"].string
    backdrop_path = results["backdrop_path"].string
    overview = results["overview"].string
  }
  
  ///Get the basic collection information for a specific collection id.
  public static func collection(_ api_key: String!, collectionId: Int!, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: CollectionMDB?) -> ()) -> (){
    Client.Collection(api_key, collectionId: String(collectionId), language: language){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn, CollectionMDB(results: apiReturn.json!))
      }else{
        completion(apiReturn, nil)
      }
    }
  }
  
  ///Get all of the images for a particular collection by collection id.
  public static func collectionImages(_ api_key: String!, collectionId: Int!, language: String?, completion:  @escaping (_ clientReturn: ClientReturn, _ data: ImagesMDB?) -> ()) -> (){
    Client.Collection(api_key, collectionId:  String(collectionId) + "/images", language: language){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn, ImagesMDB.init(results: apiReturn.json!))
      }else{
        completion(apiReturn, nil)
      }
    }
  }
}
