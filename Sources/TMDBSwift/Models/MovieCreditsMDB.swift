//
//  MovieCreditsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

open class MovieCreditsMDB: Codable {
    open var cast: [MovieCastMDB]?
    open var crew: [CrewMDB]?

    enum CodingKeys: String, CodingKey {
        case cast
        case crew
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cast = try? container.decode([MovieCastMDB]?.self, forKey: .cast)
        crew = try? container.decode([CrewMDB]?.self, forKey: .crew)
    }
}

open class MovieCastMDB: CastCrewCommonMDB {
    open var cast_id: Int!
    open var character: String!
    open var order: Int!

    enum CodingKeys: String, CodingKey {
        case cast_id
        case character
        case order
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cast_id = try? container.decode(Int?.self, forKey: .cast_id)
        character = try? container.decode(String?.self, forKey: .character)
        order = try? container.decode(Int?.self, forKey: .order)
        try super.init(from: decoder)
    }
}
