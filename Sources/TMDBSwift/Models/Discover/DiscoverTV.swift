//
//  DiscoverTV.swift
//  TheMovieDBWrapperSwift
//
//  Created by George Kye on 2016-02-05.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public enum TVGenres: String {
    case Action_Adventure = "10759"
    case Animation = "16"
    case Comedy = "35"
    case Crime = "80"
    case Documentary = "99"
    case Drama = "18"
    case Education = "10761"
    case Family = "10751"
    case Kids = "10762"
    case Mystery = "9648"
    case News = "10763"
    case Reality = "10764"
    case ScifiFantasy = "10765"
    case Soap = "10766"
    case Talk = "10767"
    case WarPolitics = "10768"
    case Western = "37"

}

public enum DiscoverSortByTV: String {

    case popularity_asc = "popularity.asc"
    case  popularity_desc = "popularity_desc"
    case vote_average_asc = "vote_average.asc"
    case vote_average_desc = "vote_average.desc"

    case first_air_date_desc = "first_air_date.desc"
    case first_air_date_asc = "first_air_date.asc"
}

open class DiscoverTVMDB: DiscoverMDB {

    open var name: String!
    open var origin_country: [String]?
    open var original_name: String?
    open var first_air_date: String?
    open var genreIds: [Int]?

    enum CodingKeys: String, CodingKey {
        case name
        case origin_country
        case original_name
        case first_air_date
        case genreIds = "genre_ids"
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try? container.decode(String?.self, forKey: .name)
        origin_country = try? container.decode([String]?.self, forKey: .origin_country)
        original_name = try? container.decode(String?.self, forKey: .original_name)
        first_air_date = try? container.decode(String?.self, forKey: .first_air_date)
        genreIds = try? container.decode([Int]?.self, forKey: .genreIds)
        try super.init(from: decoder)
    }

    open class func discoverTV(params: [DiscoverParam], completionHandler: @escaping (_ clientReturn: ClientReturn, _ data: [TVMDB]?) -> Void) {
        Client.discover(baseURL: "tv", params: params, completion: { apiReturn in
            let data: [TVMDB]? = apiReturn.decodeResults()
            completionHandler(apiReturn, data)
        })
    }
}
