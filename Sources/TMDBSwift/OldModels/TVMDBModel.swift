//
//  TVMDBModel.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public class ContentRatingsMDB: Decodable {
    public var iso_3166_1: String?
    public var rating: String?
}

public class TVMDB: DiscoverTVMDB {
    public var genres: [GenresMDB]?

    enum CodingKeys: String, CodingKey {
        case genres
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        genres = try? container.decode([GenresMDB]?.self, forKey: .genres)
        try super.init(from: decoder)
    }
}
