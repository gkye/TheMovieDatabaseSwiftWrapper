//
//  MovieListMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieListMDB{
    var description: String?
    var favorite_count: Int?
    var item_count: Int!
    var iso_639_1: String!
    var name: String!
    var poster_path: String?
    
    init(results: JSON){
        description = results["description"].string
        favorite_count = results["favorite_count"].int
        item_count = results["item_count"].int
        iso_639_1 = results["iso_639_1"].string
        name = results["name"].string
        poster_path = results["poster_path"].string
    }
    
    ///Return an array of `MovieListMDB` items
    class func initialize(json: JSON)->[MovieListMDB] {
        var movieListArray = [MovieListMDB]()
        for(var i = 0; i < json.count; i++){
            movieListArray.append(MovieListMDB(results: json[i]))
        }
        return movieListArray
    }
}