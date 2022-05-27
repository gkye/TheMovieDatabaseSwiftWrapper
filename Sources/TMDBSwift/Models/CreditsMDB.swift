//
//  CreditsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-07.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct CreditsEpisodes: Decodable {
    public var air_date: String!
    public var episode_number: Int!
    public var overview: String!
    public var season_number: Int!
    public var still_path: String?
}

public struct CreditsSeasons: Decodable {
    public var air_date: String!
    public var poster_path: String!
    public var season_number: Int!
}

public struct CreditsMedia: Decodable {
    public var id: Int!
    public var name: String!
    public var original_name: String!
    public var character: String!
    public var episodes = [CreditsEpisodes]()
    public var seasons = [CreditsSeasons]()
}

public struct CreditsMDB: Decodable {
    public var credit_type: String!
    public var department: String!
    public var job: String!
    public var media: CreditsMedia!
    public var media_Type: String!
    public var id: String!
    public var person: (name: String?, id: Int?)

    enum CodingKeys: String, CodingKey {
        case credit_type
        case department
        case job
        case media
        case media_Type = "media_type"
        case id
        case person
        case name
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        credit_type = try? container.decode(String?.self, forKey: .credit_type)
        department = try? container.decode(String.self, forKey: .department)
        job = try? container.decode(String.self, forKey: .job)
        media = try? container.decode(CreditsMedia.self, forKey: .media)
        media_Type = try? container.decode(String.self, forKey: .media_Type)
        id = try? container.decode(String.self, forKey: .id)
        let personObject = try container.nestedContainer(keyedBy:
            CodingKeys.self, forKey: .person)
        person = (name: try? personObject.decode(String.self, forKey: .name),
                  id: try? personObject.decode(Int.self, forKey: .id))
    }

    /// Get the detailed information about a particular credit record. This is currently only supported with the new credit model found in TV. These ids can be found from any TV credit response as well as the tv_credits and combined_credits methods for people. The episodes object returns a list of episodes and are generally going to be guest stars. The season array will return a list of season numbers.
    public static func credits(creditID: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: CreditsMDB?) -> Void) {
        Client.Credits(creditID: creditID) { apiReturn in
            let data: CreditsMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

}
