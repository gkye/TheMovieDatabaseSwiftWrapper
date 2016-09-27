//
//  TVMDBModel.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

open class Content_RatingsMDB: ArrayObject{
  open  var iso_3166_1: String?
  open var rating: String?
  
  required public init(results: JSON){
    iso_3166_1 = results["iso_3166_1"].string
    rating = results["rating"].string
  }
}

open class TVMDB: DiscoverTVMDB {
  
  open var name: String!
  open var origin_country: [String]?
  open var original_name: String?
  open var first_air_date: String?
  open var genreIds: [Int]?
  open var genres = [genresType]()
  public typealias genresType = (id: Int?, name: String?)
  
  
  required public init(results: JSON){
    super.init(results: results)
    name = results["name"].string
    original_name = results["original_name"].string
    
    origin_country = results["origin_country_array"].arrayObject as? [String]
    
    results["genres"].forEach(){
      genres.append(($0.1["id"].int, $0.1["name"].string))
    }
    
    first_air_date = results["first_air_date"].string
    genreIds = results["genre_ids"].arrayObject as? [Int]
    
  }
  
}
