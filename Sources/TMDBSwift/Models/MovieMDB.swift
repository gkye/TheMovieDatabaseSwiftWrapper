//
//  MoviesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public enum MovieQueryType: String {

    case nowplaying = "now_playing"
    case toprated = "top_rated"
    case upcoming = "upcoming"
    case popular = "popular"
}

extension MovieMDB {

    /// Get the basic movie information for a specific movie id.
    public class func movie(movieID: Int!, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: MovieDetailedMDB?) -> Void) {
        Client.Movies(String(movieID), page: nil, language: language) { apiReturn in
            let data: MovieDetailedMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the alternative titles for a specific movie id.
    public class func alternativeTitles(movieID: Int!, country: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ altTitles: AlternativeMovieTitlesMDB?) -> Void) {
        // language changed to country to avoid modifiying multiple defined functions.
        Client.Movies(String(movieID) + "/alternative_titles", page: nil, language: country) { apiReturn in
            let data: AlternativeMovieTitlesMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the cast and crew information for a specific movie id.
    public  class func credits(movieID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ credits: MovieCreditsMDB?) -> Void) {
        Client.Movies(String(movieID) + "/credits", page: nil, language: nil) { apiReturn in
            let data: MovieCreditsMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the images (posters and backdrops) for a specific movie id.
    public class func images(movieID: Int!, language: String?  = nil, completion: @escaping (_ clientReturn: ClientReturn, _ images: ImagesMDB?) -> Void) {
        Client.Movies(String(movieID) + "/images", page: nil, language: language) { apiReturn in
            let data: ImagesMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the plot keywords for a specific movie id.
    public class func keywords(movieID: Int, completion: @escaping (_ clientReturn: ClientReturn, _ keywords: [KeywordsMDB]?) -> Void) {
        Client.Movies(String(movieID) + "/keywords", page: nil, language: nil) { apiReturn in
            var keywords: [KeywordsMDB]?
            if let data = apiReturn.data,
               let decodedWrapper = try? JSONDecoder().decode(KeywordWrapper<KeywordsMDB>.self, from: data) {
                keywords = decodedWrapper.keywords
            }
            completion(apiReturn, keywords)
        }

    }

    /// Get the release dates, certifications and related information by country for a specific movie id.
    public class func release_dates(movieID: Int, completion: @escaping (_ clientReturn: ClientReturn, _ releatedDates: [MovieReleaseDatesMDB]?) -> Void) {
        Client.Movies(String(movieID) + "/release_dates", page: nil, language: nil) { apiReturn in
            let data: [MovieReleaseDatesMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }

    }

    /// Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
    public class func videos(movieID: Int!, language: String?  = nil, completion: @escaping (_ clientReturn: ClientReturn, _ videos: [VideosMDB]?) -> Void) {
        Client.Movies(String(movieID) + "/videos", page: nil, language: language) { apiReturn in
            let videos: [VideosMDB]? = apiReturn.decodeResults()
            completion(apiReturn, videos)
        }
    }

    /// Get the translations for a specific movie id.
    public class func translations(movieID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ translations: TranslationsMDB? ) -> Void) {
        Client.Movies(String(movieID) + "/translations", page: nil, language: nil) { apiReturn in
            var translations: TranslationsMDB?
            if let data = apiReturn.data,
               let decodedWrapper = try? JSONDecoder().decode(TranslationWrapper<TranslationsMDB>.self, from: data) {
                translations = decodedWrapper.translations
            }
            completion(apiReturn, translations)
        }

    }

    /// Get the similar movies for a specific movie id.
    public class func similar(movieID: Int!, page: Int?, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> Void) {
        Client.Movies(String(movieID) + "/similar", page: page, language: language) { apiReturn in
            let data: [MovieMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the recommended movies for a specific tv id.
    public class func recommendations(movieID: Int!, page: Int?, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> Void) {
        Client.Movies(String(movieID) + "/recommendations", page: page, language: language) { apiReturn in
            let data: [MovieMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the reviews for a particular movie id.
    public class func reviews(movieID: Int!, page: Int?, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ reviews: [MovieReviewsMDB]?) -> Void) {
        Client.Movies(String(movieID) + "/reviews", page: page, language: language) { apiReturn in
            let data: [MovieReviewsMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }

    }

    /// Get the lists that the movie belongs to.
    public class func list(movieID: Int!, page: Int?, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ list: [MovieListMDB]?) -> Void) {
        Client.Movies(String(movieID) + "/lists", page: page, language: language) { apiReturn in
            let data: [MovieListMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }

    }
    /// Get the latest movie id.
    public class func latest(completion: @escaping (_ clientReturn: ClientReturn, _ moviesDetailed: MovieDetailedMDB?) -> Void) {
        Client.Movies("latest", page: nil, language: nil) { apiReturn in
            let data: MovieDetailedMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
    public class func nowplaying(language: String? = nil, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> Void) {
        Client.Movies("now_playing", page: page, language: language) { apiReturn in
            let data: [MovieMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the list of popular movies on The Movie Database. This list refreshes every day.
    public class func popular(language: String? = nil, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> Void) {
        Client.Movies("popular", page: page, language: language) { apiReturn in
            let data: [MovieMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the list of top rated movies. By default, this list will only include movies that have 50 or more votes. This list refreshes every day.
    public class func toprated(language: String? = nil, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> Void) {
        Client.Movies("top_rated", page: page, language: language) { apiReturn in
            let data: [MovieMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Get the list of upcoming movies by release date. This list refreshes every day.
    public class func upcoming(page: Int?, language: String?  = nil, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> Void) {
        Client.Movies("upcoming", page: page, language: language) { apiReturn in
            let data: [MovieMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Retrive a list of movies using the `MovieQueryType`
    public class func query(queryType: MovieQueryType, language: String? = nil, page: Int?, region: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> Void) {
        Client.Movies(queryType.rawValue, page: page, language: language, region: region) { apiReturn in
            let data: [MovieMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }
}
