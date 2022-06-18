//
//  FindMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-09.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public enum ExternalIdTypes: String {
    case imdb_id
    case freebase_mid
    case freebase_id
    case tvdb_id
    case tvrage_id
    case id
}

public class KnownForMovie: DiscoverMovieMDB {
    public var media_type: String!

    enum CodingKeys: String, CodingKey {
        case media_type
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try super.init(from: decoder)
        media_type = try? container.decode(String?.self, forKey: .media_type)
    }
}

public class KnownForTV: DiscoverTVMDB {
    public var media_type: String!

    enum CodingKeys: String, CodingKey {
        case media_type
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try super.init(from: decoder)
        media_type = try? container.decode(String?.self, forKey: .media_type)
    }
}

public struct PersonResults: Decodable {
    public var adult: Bool!
    public var id: Int!
    public var known_for: (tvShows: [KnownForTV]?, movies: [KnownForMovie]?)
    public var name: String!
    public var popularity: Double?
    public var profile_path: String?

    enum CodingKeys: String, CodingKey {
        case adult
        case id
        case known_for
        case name
        case popularity
        case profile_path
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        adult = try? container.decode(Bool?.self, forKey: .adult)
        id = try? container.decode(Int?.self, forKey: .id)
        name = try? container.decode(String?.self, forKey: .name)
        let tv = try? container.decode([KnownForTV]?.self, forKey: .known_for)
        let movie = try? container.decode([KnownForMovie]?.self, forKey: .known_for)
        popularity = try? container.decode(Double?.self, forKey: .popularity)
        profile_path = try? container.decode(String?.self, forKey: .profile_path)
        known_for = (tv, movie)
    }
}

public struct FindMDB: Decodable {
    public var movie_results = [MovieMDB]()
    public var person_results: [PersonResults]?
    public var tv_results =  [TVMDB]()
    public var tv_episode_results = [TVEpisodesMDB]()
    public var tv_season_results =  [TVSeasonsMDB]()

    /**
     The find method makes it easy to search for objects in our database by an external id. For instance, an IMDB ID. This will search all objects (movies, TV shows and people) and return the results in a single response.
     */
    public static func find(id: String, external_source: ExternalIdTypes, completion: @escaping (_ clientReturn: ClientReturn, _ data: FindMDB?) -> Void) {
        Client.Find(external_id: id, external_source: external_source.rawValue) { apiReturn in
            let data: FindMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }
}
