//
//  MovieReleaseDatesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation


open class MovieReleaseDatesMDB: ArrayObject{
  
  open var iso_3166_1: String?
  open var release_dates = [Release_Dates]()
  required public init(results: JSON){
    iso_3166_1 = results["iso_3166_1"].string
    release_dates = Release_Dates.initialize(json: results["release_dates"])
  }
}

//move inside class?
public struct Release_Dates: ArrayObject{
  public var certification: String?
  public var iso_639_1: String?
  public var note: String?
  public var release_date: String? //change to formatted NSDate later??
  public var type: Int?
  
  public init(results release_date: JSON){
    certification = release_date["certification"].string
    iso_639_1 = release_date["iso_639_1"].string
    note = release_date["note"].string
    self.release_date = release_date["release_date"].string
    type = release_date["type"].int
  }
}
