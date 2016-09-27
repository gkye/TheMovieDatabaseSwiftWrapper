//
//  ExternalIdsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation
open class ExternalIdsMDB{
  
  open var  imdb_id: String?
  open var  freebase_mid: String?
  open var  id: Int!
  open var  freebase_id: String?
  open var  tvdb_id: Int?
  open var  tvrage_id: Int?
  
  //TV(S/EP) MV
  public init(results: JSON){
    imdb_id = results["imdb_id"].string
    freebase_mid = results["freebase_mid"].string
    freebase_id = results["freebase_id"].string
    tvdb_id = results["tvdb_id"].int
    tvrage_id = results["tvrage_id"].int
    id = results["id"].int
  }
  
}
