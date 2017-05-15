//
//  Client_MISC.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

public struct Alt_TitlesMDB: ArrayObject{
  public var title: String?
  public var iso_3166_1: String?
  public init(results: JSON){
    title = results["title"].string
    iso_3166_1 = results["iso_3166_1"].string
    
  }
}
public struct Alternative_TitlesMDB {
  
  public var id: Int!
  public var titles = [Alt_TitlesMDB]()
  
  public init(results: JSON){
    id = results["id"].int
    if(results["results"].exists()){ //TV Changes
      titles = Alt_TitlesMDB.initialize(json: results["results"])
      
    }else if (results["titles"].exists()){
      titles = Alt_TitlesMDB.initialize(json: results["titles"])
    }
  }
}
