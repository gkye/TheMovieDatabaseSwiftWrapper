//
//  ImagesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class Images_MDB {
    var aspect_ratio: String!
    var file_path: String!
    var height: Int!
    var iso_639_1: String?
    var vote_average: Int!
    var vote_count: Int!
    var width: Int!
    
    init(results: JSON){
        aspect_ratio = results["aspect_ratio"].string
        file_path = results["file_path"].string
        height = results["height"].int
        iso_639_1 = results["iso_639_1"].string
        vote_average = results["vote_average"].int
        vote_count = results["vote_count"].int
        width = results["width"].int
    }
}


class ImagesMDB {
    var backdrops = [Images_MDB]()
    var posters = [Images_MDB]()
    var stills = [Images_MDB]()
    var id: Int!
    init(results: JSON){
        id = results["id"].int
        if(results["backdrops"].count > 0){
            for (var i = 0; i < results["backdrops"].count; i++){
                backdrops.append(Images_MDB(results: results["backdrops"][i]))
            }
        }
        if(results["posters"].count > 0){
            for (var i = 0; i < results["posters"].count; i++){
                posters.append(Images_MDB(results: results["posters"][i]))
            }
        }
        
        if(results["stills"].count > 0){
            for (var i = 0; i < results["stills"].count; i++){
               stills.append(Images_MDB(results: results["stills"][i]))
            }
        }
        
        
    }
    
}

