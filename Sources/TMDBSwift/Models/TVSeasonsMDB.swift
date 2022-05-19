//
//  SeasonsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct TVSeasonsMDB: Codable {

    public var air_date: String!
    public var episodes = [TVEpisodesMDB]()
    public var name: String!
    public var overview: String!
    public var id: Int!
    public var poster_path: String!
    public var season_number: Int!

    /// Get the primary information about a TV season by its season number.
    public static func season_number(tvShowId: Int!, seasonNumber: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVSeasonsMDB?) -> Void) {

        let urltype = String(tvShowId) + "/season/" + String(seasonNumber)
        Client.Seasons(urltype, language: language) { apiReturn in
            let data: TVSeasonsMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the cast & crew credits for a TV season by season number.
    public static func credits(tvShowId: Int!, seasonNumber: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVCreditsMDB?) -> Void) {
        //     [/tv/11/season/1/credits]
        let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/credits"
        Client.Seasons(urltype, language: language) { apiReturn in
            let data: TVCreditsMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the external ids that we have stored for a TV season by season number.
    public static func externalIDS(tvShowId: Int!, seasonNumber: Int!, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: ExternalIdsMDB?) -> Void) {
        let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/external_ids"
        Client.Seasons(urltype, language: language) { apiReturn in
            var data: ExternalIdsMDB?
            if let json = apiReturn.json {
                data = ExternalIdsMDB.init(results: json)
            }
            completion(apiReturn, data)
        }
    }

    /// Get the images (posters) that we have stored for a TV season by season number. **[backdrops] returned in ImagesMDB will be `nil`
    public static func images(tvShowId: Int!, seasonNumber: Int!, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: ImagesMDB?) -> Void) {
        let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/images"
        Client.Seasons(urltype, language: language) { apiReturn in
            let data: ImagesMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the videos that have been added to a TV season (trailers, teasers, etc...)
    public static func videos(tvShowId: Int!, seasonNumber: Int!, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: [VideosMDB]?) -> Void) {
        //     [/tv/11/season/1/credits]
        let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/videos"
        Client.Seasons(urltype, language: language) { apiReturn in
            let results: [VideosMDB]? = apiReturn.decodeResults()

            completion(apiReturn, results)
        }
    }
}
