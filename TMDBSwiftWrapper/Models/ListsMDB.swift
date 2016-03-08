//
//  ListMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

///TODO: ListItem status 

class ListsMDB{
    
    var created_by: String!
    var description: String?
    var favorite_count: Int!
    var id: String!
    var items = [MovieMDB]()
    var item_count: Int!
    var iso_639_1: String!
    var name:  String!
    var poster_path:  String?
    
    init(results: JSON){
        created_by = results["created_by"].string
        description = results["description"].string
        favorite_count = results["favorite_count"].int
        id = results["id"].string
        items = MovieMDB.initialize(results["items"])
        item_count = results["items_count"].int
        iso_639_1 = results["iso_639_1"].string
        name = results["name"].string
        poster_path = results["poster_path"].string
    }
    
    ///MARK: Lists
    ///TODO: List item status
    ///Get a list by id.
    class func lists(api_key: String!, listId: String!, completion: (ClientReturn) -> ()) -> (){
        let url  = "http://api.themoviedb.org/3/list/\(listId)"
        Client.Lists(url, api_key: api_key, listId: listId!){
            apiReturn in
            var aReturn = apiReturn
            if(apiReturn.error == nil){
                aReturn.MBDBReturn = ListsMDB.init(results: aReturn.json!)
            }
            completion(aReturn)
        }
        
    }
}
