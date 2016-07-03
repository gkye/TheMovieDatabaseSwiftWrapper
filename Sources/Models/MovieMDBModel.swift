//
//  MovieMDBModel.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public class MovieMDB:  DiscoverMovieMDB{
  
  public var title: String?
  public var video: Bool?
  public var release_date: String?
  public var original_title: String?
  public var genres = [genresType]()
  public typealias genresType = (id: Int!, name: String!)
  
  required public init(results: JSON) {
    super.init(results: results)
    title = results["title"].string
    video = results["video"].bool
    adult = results["adult"].bool
    release_date = results["release_date"].string
    original_title = results["original_title"].string
    results["genres"].forEach(){
      genres.append(($0.1["id"].int, $0.1["name"].string))
    }
  }
}
