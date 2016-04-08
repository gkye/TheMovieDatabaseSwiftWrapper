//
//  MovieReviewMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public class MovieReviewsMDB{
    
   public var id: String!
   public var author: String!
   public var content: String!
   public var url: String!
    
    init(results: JSON){
        id = results["id"].string
        author = results["author"].string
        content = results["content"].string
        url = results["url"].string
    }
    ///Return an array of `MovieReviewsMDB`s
    class func initialize(json: JSON)->[MovieReviewsMDB] {
        var moveReviewArray = [MovieReviewsMDB]()
        for(var i = 0; i < json.count; i++){
            moveReviewArray.append(MovieReviewsMDB(results: json[i]))
        }
        return moveReviewArray
    }
}