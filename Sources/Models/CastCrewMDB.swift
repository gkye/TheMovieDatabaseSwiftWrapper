//
//  CastMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public class CastCrewCommonMDB{
    public var credit_id: String!
    public var id: Int!
    public var name: String!
    public var profile_path: String?
    
    init(results: JSON){
        credit_id = results["credit_id"].string
        id = results["id"].int
        name = results["name"].string
        profile_path = results["profile_path"].string
    }
    
}

//Common obj between both TVCredits & MovieCredits
public class CrewMDB: CastCrewCommonMDB{
    public var department: String!
    public var job: String!
    init(crew: JSON){
        super.init(results: crew)
        department = crew["department"].string
        job = crew["job"].string
    }
}

