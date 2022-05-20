//
//  MovieListMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

open class MovieListMDB: Codable {
    open var description: String?
    open var favorite_count: Int?
    open var item_count: Int!
    open var iso_639_1: String!
    open var name: String!
    open var poster_path: String?
    open var id: Int!
}
