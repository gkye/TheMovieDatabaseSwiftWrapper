//
//  MovieCreditsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public class MovieCreditsMDB{
    
    public  var cast = [MovieCastMDB]()
    public  var crew = [CrewMDB]()
    
    init(results: JSON){
        for cast in results["cast"]{
            self.cast.append(MovieCastMDB.init(cast: cast.1))
        }
        
        for crew in results["crew"]{
            self.crew.append(CrewMDB.init(crew: crew.1))
        }
    }
    
}

public class MovieCastMDB: CastCrewCommonMDB{
    
    public var cast_id: Int!
    public var character: String!
    public var order: Int!
    
    init(cast: JSON){
        super.init(results: cast)
        cast_id = cast["cast_id"].int
        character = cast["character"].string
        order = cast["order"].int
    }
}

