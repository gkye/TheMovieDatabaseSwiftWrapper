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

public class TVDetailedMDB: TVMDB {
    public var createdBy: [TVCreatedBy]?
    public var episode_run_time: [Int]!
    public var homepage: String?
    public var in_production: Bool?
    public var languages: [String]?
    public var last_air_date: String!
    public var networks: [KeywordsMDB]?
    public var number_of_episodes: Int!
    public var number_of_seasons: Int!
    public var production_companies: [KeywordsMDB]?
    public var seasons: [TVSeasons]?
    public var status: String!
    public var type: String!
    public var nextEpisodeToAir: TVEpisodesMDB?
    public var lastEpisodeToAir: TVEpisodesMDB?

    enum CodingKeys: String, CodingKey {
        case createdBy
        case episode_run_time
        case homepage
        case in_production
        case languages
        case last_air_date
        case networks
        case number_of_episodes
        case number_of_seasons
        case production_companies
        case seasons
        case status
        case type
        case next_episode_to_air
        case last_episode_to_air
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        createdBy = try? container.decode([TVCreatedBy].self, forKey: .createdBy)
        episode_run_time = try? container.decode([Int].self, forKey: .episode_run_time)
        homepage = try? container.decode(String.self, forKey: .homepage)
        in_production = try? container.decode(Bool.self, forKey: .in_production)
        languages = try? container.decode([String].self, forKey: .languages)
        last_air_date = try? container.decode(String.self, forKey: .last_air_date)
        networks = try? container.decode([KeywordsMDB].self, forKey: .networks)
        number_of_episodes = try? container.decode(Int.self, forKey: .number_of_episodes)
        number_of_seasons = try? container.decode(Int.self, forKey: .number_of_seasons)
        production_companies = try? container.decode([KeywordsMDB].self, forKey: .production_companies)
        seasons = try? container.decode([TVSeasons].self, forKey: .seasons)
        status = try? container.decode(String.self, forKey: .status)
        type = try? container.decode(String.self, forKey: .type)
        nextEpisodeToAir = try? container.decode(TVEpisodesMDB.self, forKey: .next_episode_to_air)
        lastEpisodeToAir = try? container.decode(TVEpisodesMDB.self, forKey: .last_episode_to_air)
        try super.init(from: decoder)
    }
}
