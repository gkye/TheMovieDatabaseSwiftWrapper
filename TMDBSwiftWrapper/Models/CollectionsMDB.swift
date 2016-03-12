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
    
    
    struct collectionMDBReturn{
        let clientReturn: ClientReturn!
        let collectionMDBData: CollectionMDB?
        init(client: ClientReturn){
            clientReturn = client
            collectionMDBData = CollectionMDB(results: client.json!)
        }
    }
    
    struct collectionMDBImageReturn{
        let clientReturn: ClientReturn!
        let collectionImagesMDBData: ImagesMDB?
        init(client: ClientReturn){
            clientReturn = client
            collectionImagesMDBData = ImagesMDB.init(results: client.json!)
        }
    }
    
    ///Get the basic collection information for a specific collection id.
    class func Collection(api_key: String!, collectionId: Int!, language: String?, completion: (collectionMDBReturn) -> ()) -> (){
        Client.Collection(api_key, collectionId: "\(collectionId)", language: language){
            apiReturn in
            if(apiReturn.error == nil){
                completion(collectionMDBReturn.init(client: apiReturn))
            }
        }
    }
    
    ///Get all of the images for a particular collection by collection id.
    class func CollectionImages(api_key: String!, collectionId: Int!, language: String?, completion: (collectionMDBImageReturn) -> ()) -> (){
        let modId =  "\(collectionId)/images"
        Client.Collection(api_key, collectionId: modId, language: language){
            apiReturn in
            if(apiReturn.error == nil){
                completion(collectionMDBImageReturn.init(client: apiReturn))
            }else{
                
            }
        }
    }
}