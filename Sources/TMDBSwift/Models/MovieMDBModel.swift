//
//  MovieMDBModel.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct GenreMDB: Decodable {
    let id: Int?
    let name: String?
}

open class MovieMDB: DiscoverMovieMDB {
    open var genres: [GenreMDB]?

    enum CodingKeys: String, CodingKey {
        case genres
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        genres = try? container.decode([GenreMDB]?.self, forKey: .genres)
        try super.init(from: decoder)
    }
}
