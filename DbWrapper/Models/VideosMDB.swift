//
//  VideoMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class VideosMDB{
    var id: String!
    var iso_639_1: String!
    var key: String!
    var name: String!
    var site: String!
    var size: Int!
    var  type: String!
    
 init(results: JSON){
        id = results["id"].string
        iso_639_1 = results["iso_639_1"].string
        key = results["key"].string
        name = results["name"].string
        site = results["site"].string
        size = results["size"].int
        type = results["type"].string
    }
    
    class func initialize(json: JSON)->[VideosMDB] {
        var videoArray = [VideosMDB]()
        for(var i = 0; i < json.count; i++){
            videoArray.append(VideosMDB(results: json[i]))
        }
        return videoArray
    }
}