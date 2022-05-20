//
//  EpisodesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct TVEpisodesMDB: Codable {

    public var air_date: String!
    public var crew = [CrewMDB]()
    public var guest_stars = [TVCastMDB]()
    public var episode_number: Int!
    public var name: String!
    public var overview: String!
    public var id: Int!
    public var production_code: Int!
    public var season_number: Int!
    public var still_path: String!
    public var vote_average: Int!
    public var vote_count: Int!

    /// Get the primary information about a TV episode by combination of a season and episode number.
    public static func episode_number(tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVEpisodesMDB?) -> Void) {
        let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/episode/" + String(episodeNumber)
        Client.Seasons(urltype, language: language) { apiReturn in
            let data: TVEpisodesMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the TV episode credits by combination of season and episode number.
    public static func credits(tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVCreditsMDB?) -> Void) {
        let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/episode/" + String(episodeNumber) + "/credits"
        Client.Seasons(urltype, language: nil) { apiReturn in
            let data: TVCreditsMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the external ids for a TV episode by comabination of a season and episode number.
    public static func externalIDS(tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int, language: String, completion: @escaping (_ clientReturn: ClientReturn, _ data: ExternalIdsMDB?) -> Void) {
        let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/episode/" + String(episodeNumber) + "/external_ids"
        Client.Seasons(urltype, language: language) { apiReturn in
            let data: ExternalIdsMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the images (episode stills) for a TV episode by combination of a season and episode number. Since episode stills don't have a language, this call will always return all images. **ONLY `stills` retuned from ImagesMDB (`posters` & `backdrops` will be empty)**
    public static func images(tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: ImagesMDB?) -> Void) {
        let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/episode/" + String(episodeNumber) + "/images"
        Client.Seasons(urltype, language: nil) { apiReturn in
            let data: ImagesMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the videos that have been added to a TV episode (teasers, clips, etc...)
    public static func videos(tvShowId: Int!, seasonNumber: Int!, episodeNumber: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [VideosMDB]?) -> Void) {
        let urltype = String(tvShowId) + "/season/" + String(seasonNumber) + "/episode/" + String(episodeNumber) + "/videos"
        Client.Seasons(urltype, language: language) { apiReturn in
            let videos: [VideosMDB]? = apiReturn.decodeResults()

            completion(apiReturn, videos)
        }
    }
}
