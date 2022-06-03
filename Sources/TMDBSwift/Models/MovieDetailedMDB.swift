//
//  MovieDetailedMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-16.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct BelongsToCollectionMovieMDB: Decodable {
    public var id: Int!
    public var name: String!
    public var poster_path: String!
    public var backdrop_path: String!
}

public struct SpokenLanguages: Decodable {
    public var iso_639_1: String!
    public var name: String!
}

public class MovieDetailedMDB: MovieMDB {
    public var belongs_to_collection: BelongsToCollectionMovieMDB?
    public var budget: Int?
    public var homepage: String?
    public var imdb_id: Int!
    public var production_companies: [KeywordsMDB]? = []
    public var production_countries: [KeywordsMDB]? = []
    public var revenue: Int?
    public var runtime: Int?
    public var spoken_languages: [SpokenLanguages]? = []
    public var status: String!
    public var tagline: String!
}
