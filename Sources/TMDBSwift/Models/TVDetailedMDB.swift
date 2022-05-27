//
//  TVDetailedMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct TVCreatedBy: Decodable {
    public var id: Int!
    public var name: String!
    public var profile_path: String!
}

public struct TVSeasons: Decodable {
    public var air_date: String?
    public var episode_count: Int!
    public var id: Int!
    public var poster_path: String!
    public var season_number: Int!
}

open class TVDetailedMDB: TVMDB {
    open var createdBy: [TVCreatedBy]?
    open var episode_run_time: [Int]!
    open var homepage: String?
    open var in_production: Bool?
    open var languages: [String]?
    open var last_air_date: String!
    open var networks = [KeywordsMDB]()
    open var number_of_episodes: Int!
    open var number_of_seasons: Int!
    open var production_companies = [KeywordsMDB]()
    open var seasons = [TVSeasons]()
    open var status: String!
    open var type: String!
    open var nextEpisodeToAir: TVEpisodesMDB?
    open var lastEpisodeToAir: TVEpisodesMDB?

}
