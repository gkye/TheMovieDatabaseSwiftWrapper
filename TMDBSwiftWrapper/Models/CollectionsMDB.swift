//
//  Collection.swift
//  TheMovieDBWrapperSwift
//
//  Created by George on 2016-02-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

//** CHECK LISt-> may contain collection or tv object.

class CollectionMDB{
    
    var id: Double?
    var name: String?
    var poster_path: String?
    var backdrop_path: String?
    var overview: String?
    var collectionItems = [MovieMDB]()
    
    
    init(results: JSON) {
        for(var i = 0; i < results["parts"].count; i++){
            collectionItems.append(MovieMDB(results: results["parts"][i]))
        }
        id = results["id"].double
        name = results["name"].string
        poster_path = results["poster_path"].string
        backdrop_path = results["backdrop_path"].string
        overview = results["overview"].string
    }
    
    ///Get the basic collection information for a specific collection id.
    class func Collection(api_key: String!, collectionId: Int!, language: String?, completion: (clientReturn: ClientReturn, data: CollectionMDB?) -> ()) -> (){
        Client.Collection(api_key, collectionId: "\(collectionId)", language: language){
            apiReturn in
            if(apiReturn.error == nil){
                completion(clientReturn: apiReturn, data: CollectionMDB(results: apiReturn.json!))
            }else{
                completion(clientReturn: apiReturn, data: nil)
            }
        }
    }
    
    ///Get all of the images for a particular collection by collection id.
    class func CollectionImages(api_key: String!, collectionId: Int!, language: String?, completion:  (clientReturn: ClientReturn, data: ImagesMDB?) -> ()) -> (){
        let modId =  "\(collectionId)/images"
        Client.Collection(api_key, collectionId: modId, language: language){
            apiReturn in
            if(apiReturn.error == nil){
                completion(clientReturn: apiReturn, data: ImagesMDB.init(results: apiReturn.json!))
            }else{
                completion(clientReturn: apiReturn, data: nil)
            }
        }
    }
}