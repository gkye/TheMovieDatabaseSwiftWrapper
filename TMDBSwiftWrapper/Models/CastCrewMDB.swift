//
//  CastMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

//Share vars?? With TVCredits & MovieCredits
class CastCrewCommonMDB{
    var credit_id: String!
    var id: Int!
    var name: String!
    var profile_path: String?
    
    init(results: JSON){
        credit_id = results["credit_id"].string
        id = results["id"].int
        name = results["name"].string
        profile_path = results["profile_path"].string
    }
    
}

//Common obj between both TVCredits & MovieCredits
class CrewMDB: CastCrewCommonMDB{
    var department: String!
    var job: String!
    init(crew: JSON){
        super.init(results: crew)
        department = crew["department"].string
        job = crew["job"].string
    }
}

