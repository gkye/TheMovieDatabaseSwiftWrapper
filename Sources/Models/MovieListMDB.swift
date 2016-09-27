//
//  MovieListMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation


open class MovieListMDB: ArrayObject{
  open var description: String?
  open var favorite_count: Int?
  open var item_count: Int!
  open var iso_639_1: String!
  open var name: String!
  open var poster_path: String?
  open var id: String!
  
  required public init(results: JSON){
    id = results["id"].string
    description = results["description"].string
    favorite_count = results["favorite_count"].int
    item_count = results["item_count"].int
    iso_639_1 = results["iso_639_1"].string
    name = results["name"].string
    poster_path = results["poster_path"].string
  }
  
}
