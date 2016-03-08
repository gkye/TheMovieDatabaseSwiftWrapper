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
    var i = 0;
    
    init(results: JSON) {
        for(i = 0; i < results["parts"].count; i++){
            collectionItems.append(MovieMDB(results: results["parts"][i]))
        }
        id = results["id"].double
        name = results["name"].string
        poster_path = results["poster_path"].string
        backdrop_path = results["backdrop_path"].string
        overview = results["overview"].string
    }
    
    ///Get the basic collection information for a specific collection id.
    class func Collection(api_key: String!, collectionId: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.Collection(api_key, collectionId: "\(collectionId)", language: language){
            apiReturn in
            var aReturn = apiReturn;
            if(apiReturn.error == nil){
                aReturn.MBDBReturn = CollectionMDB(results: apiReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get all of the images for a particular collection by collection id.
    class func CollectionImages(api_key: String!, collectionId: Int!, language: String?, completion: (ClientReturn) -> ()) -> (){
        let modId =  "\(collectionId)/images"
        Client.Collection(api_key, collectionId: modId, language: language){
            apiReturn in
            var aReturn = apiReturn;
            if(apiReturn.error == nil){
                aReturn.MBDBReturn = ImagesMDB.init(results: aReturn.json!)
            }
            completion(aReturn)
        }
    }
}