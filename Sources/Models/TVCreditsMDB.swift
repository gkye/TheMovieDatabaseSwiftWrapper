//
//  TVCreditsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

public class TVCreditsMDB{
   public var cast = [TVCastMDB]()
   public var crew = [CrewMDB]()
    
    init(results: JSON){
        
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


public class TVCastMDB: CastCrewCommonMDB{
    public var character: String!
    public var order: Int!
    init(cast: JSON){
        super.init(results: cast)
        character = cast["character"].string
        order = cast["order"].int
    }
}



