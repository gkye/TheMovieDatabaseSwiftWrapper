//
//  CastMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

open class CastCrewCommonMDB{
  open var credit_id: String!
  open var id: Int!
  open var name: String!
  open var profile_path: String?
  
  init(results: JSON){
    credit_id = results["credit_id"].string
    id = results["id"].int
    name = results["name"].string
    profile_path = results["profile_path"].string
  }
  
}

//Common obj between both TVCredits & MovieCredits
open class CrewMDB: CastCrewCommonMDB{
  open var department: String!
  open var job: String!
  public init(crew: JSON){
    super.init(results: crew)
    department = crew["department"].string
    job = crew["job"].string
  }
}

open class TVCastMDB: CastCrewCommonMDB{
  open var character: String!
  open var order: Int!
  public init(cast: JSON){
    super.init(results: cast)
    character = cast["character"].string
    order = cast["order"].int
  }
}


open class TVCreditsMDB{
  open var cast = [TVCastMDB]()
  open var crew = [CrewMDB]()
  
  public init(results: JSON){
    //tv cast
    for castResult in results["cast"]{
      cast.append(TVCastMDB.init(cast: castResult.1))
    }
    //crew -- common
    for crewResults in results["crew"]{
      crew.append(CrewMDB.init(crew: crewResults.1))
    }
  }
}



