//
//  MovieListMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public class MovieListMDB: Decodable {
    public var description: String?
    public var favorite_count: Int?
    public var item_count: Int!
    public var iso_639_1: String!
    public var name: String!
    public var poster_path: String?
    public var id: Int!
}
