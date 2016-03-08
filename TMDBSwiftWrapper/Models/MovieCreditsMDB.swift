//
//  MovieCreditsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieCreditsMDB{

    var cast = [MovieCastMDB]()
    var crew = [CrewMDB]()
    
    init(results: JSON){
        for cast in results["cast"]{
            self.cast.append(MovieCastMDB.init(cast: cast.1))
        }
        
        for crew in results["crew"]{
            self.crew.append(CrewMDB.init(crew: crew.1))
        }
    }
    
}

class MovieCastMDB: CastCrewCommonMDB{
    
    var cast_id: Int!
    var character: String!
    var order: Int!
    
    init(cast: JSON){
        super.init(results: cast)
        cast_id = cast["cast_id"].int
        character = cast["character"].string
        order = cast["order"].int
    }
}

