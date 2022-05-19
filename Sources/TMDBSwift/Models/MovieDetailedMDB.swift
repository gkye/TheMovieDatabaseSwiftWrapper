//
//  MovieDetailedMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-16.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct BelongsToCollectionMovieMDB: Codable {
    public var id: Int!
    public var name: String!
    public var poster_path: String!
    public var backdrop_path: String!
    init(results: JSON) {
        id = results["id"].int
        name = results["name"].string
        poster_path = results["poster_path"].string
        backdrop_path = results["backdrop_path"].string
    }
}

public struct SpokenLanguages: Codable {
    public var iso_639_1: String!
    public var name: String!
    init(results: JSON) {
        iso_639_1 = results["iso_639_1"].string
        name = results["name"].string
    }
}

open class MovieDetailedMDB: MovieMDB {
    open var belongs_to_collection: BelongsToCollectionMovieMDB?
    open var budget: Int?
    open var homepage: String?
    open var imdb_id: Int!
    open var production_companies: [KeywordsMDB]? = []
    open var production_countries: [KeywordsMDB]? = []
    open var revenue: Int?
    open var runtime: Int?
    open var spoken_languages: [SpokenLanguages]? = []
    open var status: String!
    open var tagline: String!
}
