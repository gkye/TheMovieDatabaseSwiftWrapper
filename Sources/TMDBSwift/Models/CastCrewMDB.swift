//
//  CastMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public class CastCrewCommonMDB: Decodable {
    public var credit_id: String!
    public var id: Int!
    public var name: String!
    public var profile_path: String?
}

// Common obj between both TVCredits & MovieCredits
public class CrewMDB: CastCrewCommonMDB {
    public var department: String!
    public var job: String!

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

public class TVCastMDB: CastCrewCommonMDB {
    public var character: String!
    public var order: Int!

    enum CodingKeys: String, CodingKey {
        case character
        case order
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        character = try? container.decode(String?.self, forKey: .character)
        order = try? container.decode(Int?.self, forKey: .order)
        try super.init(from: decoder)
    }
}

public class TVCreditsMDB: Decodable {
    public var cast = [TVCastMDB]()
    public var crew = [CrewMDB]()
}
