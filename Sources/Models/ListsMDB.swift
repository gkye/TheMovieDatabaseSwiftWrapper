//
//  ListMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation


///TODO: ListItem status

public struct ListsMDB: ArrayObject{
  
  public  var created_by: String!
  public  var description: String?
  public var favorite_count: Int!
  public  var id: String!
  public  var items = [MovieMDB]()
  public  var item_count: Int!
  public  var iso_639_1: String!
  public  var name:  String!
  public  var poster_path:  String?
  
  public init(results: JSON){
    created_by = results["created_by"].string
    description = results["description"].string
    favorite_count = results["favorite_count"].int
    id = results["id"].string
    items = MovieMDB.initialize(json: results["items"])
    item_count = results["items_count"].int
    iso_639_1 = results["iso_639_1"].string
    name = results["name"].string
    poster_path = results["poster_path"].string
  }
  
  ///MARK: Lists
  public  static func lists(_ api_key: String!, listId: String!, completion: @escaping (_ clientReturn: ClientReturn, _ data: ListsMDB?) -> ()) -> (){
    let url  = "https://api.themoviedb.org/3/list/" + listId
    Client.Lists(url, api_key: api_key, listId: listId!){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn, ListsMDB.init(results: apiReturn.json!))
      }else{
        completion(apiReturn, nil)
      }
    }
    
  }
}
