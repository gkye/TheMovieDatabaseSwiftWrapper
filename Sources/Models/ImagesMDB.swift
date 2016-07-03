//
//  ImagesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public class Images_MDB: ArrayObject {
  public var aspect_ratio: Double?
  public var file_path: String?
  public var height: Int?
  public var iso_639_1: String?
  public var vote_average: Double?
  public var vote_count: Int?
  public var width: Int?
  
  required public init(results: JSON){
    aspect_ratio = results["aspect_ratio"].double
    file_path = results["file_path"].string
    height = results["height"].int
    iso_639_1 = results["iso_639_1"].string
    vote_average = results["vote_average"].double
    vote_count = results["vote_count"].int
    width = results["width"].int
  }
  
}


public struct ImagesMDB {
  public var backdrops = [Images_MDB]()
  public var posters = [Images_MDB]()
  public var stills = [Images_MDB]()
  public var id: Int!
  init(results: JSON){
    id = results["id"].int
    if(results["backdrops"].count > 0){
      backdrops = Images_MDB.initialize(json: results["backdrops"])
    }
    if(results["posters"].count > 0){
      posters = Images_MDB.initialize(json: results["posters"])
    }
    
    if(results["stills"].count > 0){
      stills = Images_MDB.initialize(json: results["stills"])
    }
  }
  
}

