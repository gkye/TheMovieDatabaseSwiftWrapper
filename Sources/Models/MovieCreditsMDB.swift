//
//  MovieCreditsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

open class MovieCreditsMDB{
  
  open  var cast = [MovieCastMDB]()
  open  var crew = [CrewMDB]()
  
  public init(results: JSON){
    for cast in results["cast"]{
      self.cast.append(MovieCastMDB.init(cast: cast.1))
    }
    
    for crew in results["crew"]{
      self.crew.append(CrewMDB.init(crew: crew.1))
    }
  }
}

open class MovieCastMDB: CastCrewCommonMDB{
  
  open var cast_id: Int!
  open var character: String!
  open var order: Int!
  
  init(cast: JSON){
    super.init(results: cast)
    cast_id = cast["cast_id"].int
    character = cast["character"].string
    order = cast["order"].int
  }
}

