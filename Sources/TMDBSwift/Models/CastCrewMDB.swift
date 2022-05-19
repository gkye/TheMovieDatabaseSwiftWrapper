//
//  CastMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

open class CastCrewCommonMDB: Codable {
    open var credit_id: String!
    open var id: Int!
    open var name: String!
    open var profile_path: String?
}

// Common obj between both TVCredits & MovieCredits
open class CrewMDB: CastCrewCommonMDB {
    open var department: String!
    open var job: String!

    enum CodingKeys: String, CodingKey {
        case department
        case job
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        department = try? container.decode(String?.self, forKey: .department)
        job = try? container.decode(String?.self, forKey: .job)
        try super.init(from: decoder)
    }
}

open class TVCastMDB: CastCrewCommonMDB {
    open var character: String!
    open var order: Int!
}

open class TVCreditsMDB: Codable {
    open var cast = [TVCastMDB]()
    open var crew = [CrewMDB]()
}
