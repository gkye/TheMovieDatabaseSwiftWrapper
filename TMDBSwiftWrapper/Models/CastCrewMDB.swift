//
//  CastMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON


internal class CastANDCrewMDB{
    var credit_id: Int!
    var id: Int!
    var name: String!
    var profile_path: String!
    init(results: JSON){
        credit_id = results["id"].int
        id = results["credit_id"].int
        name = results["name"].string
        profile_path = results["profile_path"].string
    }
}

internal  class CrewMDB : CastANDCrewMDB {
    var department: String!
    var job: String!
    override init(results: JSON) {
        super.init(results: results)
        department = results["department"].string
        job = results["department"].string
    }
}

internal class CastMDB: CastANDCrewMDB {
    var cast_id: Int!
    var character: String!
    var order: Int!
    override init(results: JSON) {
        super.init(results: results)
        cast_id = results["cast_id"].int
        character = results["character"].string
        order = results["order"].int
    }
}


class CastCrewMDB{
    
    var cast = [CastMDB]()
    var crew = [CrewMDB]()
    var id: Int!
    init(results: JSON){
        id = results["id"].int
        if(results["crew"].count > 0){
            for(var i = 0; i < results["crew"].count; i++ ){
                crew.append(CrewMDB(results: results["crew"][i]))
            }
        }
        if(results["cast"].count > 0){
            for(var i = 0; i < results["cast"].count; i++ ){
                cast.append(CastMDB(results: results["cast"][i]))
            }
        }
    }
    
}