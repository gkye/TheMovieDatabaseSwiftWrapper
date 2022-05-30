//
//  TVMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public enum TVQueryType: String {
    case latest, popular
    case airingtoday = "airing_today"
    case ontheair = "on_the_air"
    case toprated = "top_rated"
}

extension TVMDB {

    /// Get the primary information about a TV series by id.
    public class func tv(tvShowID: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: TVDetailedMDB?) -> Void) {

        Client.TV(String(tvShowID), page: nil, language: language) { apiReturn in
            let data: TVDetailedMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the alternative titles for a specific show ID.
    public class func alternativeTitles(tvShowID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: AlternativeTVTitlesMDB?) -> Void) {
        Client.TV( String(tvShowID) + "/alternative_titles", page: nil, language: nil) { apiReturn in
            let data: AlternativeTVTitlesMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the content ratings for a specific TV show id.
    public class func content_ratings(tvShowID: Int, completion: @escaping (_ clientReturn: ClientReturn, _ data: [ContentRatingsMDB]?) -> Void) {
        Client.TV(String(tvShowID) + "/content_ratings", page: nil, language: nil) { apiReturn in
            let data: [ContentRatingsMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the cast & crew information about a TV series. Just like the website, this information from the last season of the series.
    public class func credits(tvShowID: Int!, completion: @escaping (_ clientResult: ClientReturn, _ data: TVCreditsMDB?) -> Void) {
        Client.TV(String(tvShowID) + "/credits", page: nil, language: nil) { apiReturn in
            let data: TVCreditsMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    // Get the external ids that we have stored for a TV series.
    public class func externalIDS(tvShowID: Int!, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: ExternalIdsMDB?) -> Void) {
        Client.TV(String(tvShowID) + "/external_ids", page: nil, language: language) { apiReturn in
            let data: ExternalIdsMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the images (posters and backdrops) for a TV series.
    public class func images(tvShowID: Int!, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: ImagesMDB?) -> Void) {
        Client.TV(String(tvShowID) + "/images", page: nil, language: language) { apiReturn in
            let data: ImagesMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the plot keywords for a specific TV show id.
    public class func keywords(tvShowID: Int!, completion: @escaping (_ clientResult: ClientReturn, _ data: [KeywordsMDB]?) -> Void) {
        Client.TV(String(tvShowID) + "/keywords", page: nil, language: nil) { apiReturn in
            let data: [KeywordsMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the similar TV shows for a specific tv id.
    public  class func similar(tvShowID: Int!, page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [DiscoverTVMDB]?) -> Void) {
        Client.TV(String(tvShowID) + "/similar", page: page, language: language) { apiReturn in
            let data: [DiscoverTVMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the recommended TV shows for a specific tv id.
    public  class func recommendations(tvShowID: Int!, page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> Void) {
        Client.TV(String(tvShowID) + "/recommendations", page: page, language: language) { apiReturn in
            let data: [TVMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the list of translations that exist for a TV series. These translations cascade down to the episode level.
    public class func translations(tvShowID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: [TranslationsMDB]?) -> Void) {
        Client.TV(String(tvShowID) + "/translations", page: nil, language: nil) { apiReturn in
            var translations: [TranslationsMDB]?
            if let data = apiReturn.data,
               let decodedWrapper = try? JSONDecoder().decode(TranslationsWrapper<TranslationsMDB>.self, from: data) {
                translations = decodedWrapper.translations
            }
            completion(apiReturn, translations)
        }

    }

    /// Get the videos that have been added to a TV series (trailers, opening credits, etc...)
    public class func videos(tvShowID: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [VideosMDB]?) -> Void) {
        Client.TV(String(tvShowID) + "/videos", page: nil, language: language) { apiReturn in
            let videos: [VideosMDB]? = apiReturn.decodeResults()
            completion(apiReturn, videos)
        }
    }

    /// Get the latest TV show id.
    public class func latest( completion: @escaping (_ clientReturn: ClientReturn, _ data: TVDetailedMDB?) -> Void) {
        Client.TV("latest", page: nil, language: nil) { apiReturn in
            let data: TVDetailedMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the list of TV shows that are currently on the air. This query looks for any TV show that has an episode with an air date in the next 7 days.
    public class func ontheair(page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> Void) {
        Client.TV("on_the_air", page: page, language: language) { apiReturn in
            let data: [TVMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the list of TV shows that air today. Without a specified timezone, this query defaults to EST (Eastern Time UTC-05:00).
    public  class func airingtoday(page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> Void) {
        Client.TV("airing_today", page: page, language: language) { apiReturn in
            let data: [TVMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the list of top rated TV shows. By default, this list will only include TV shows that have 2 or more votes. This list refreshes every day.
    public class func toprated(page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> Void) {
        Client.TV("top_rated", page: page, language: language) { apiReturn in
            let data: [TVMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the list of popular TV shows. This list refreshes every day.
    public class func popular(page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> Void) {
        Client.TV("popular", page: page, language: language) { apiReturn in
            let data: [TVMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get data using TVQueryType Enum for popular, toprated, airing today and on air queries
    public class func query(queryType: TVQueryType, page: Int?, language: String?, completion: @escaping (_ clientResult: ClientReturn, _ data: [TVMDB]?) -> Void) {
        Client.TV(queryType.rawValue, page: page, language: language) { apiReturn in
            let data: [TVMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }
}
