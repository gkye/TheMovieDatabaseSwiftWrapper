//
//  MovieMDBModel.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation


open class MovieMDB: DiscoverMovieMDB{
  
  open var title: String?
  open var video: Bool?
  open var release_date: String?
  open var original_title: String?
  open var genres = [genresType]()
  public typealias genresType = (id: Int?, name: String?)
  
  public required init(results: JSON) {
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
