//
//  MoviesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

extension MovieMDB{
    
    ///Get the basic movie information for a specific movie id.
    public class func movie(api_key: String!, movieID: Int!, language: String?, completion: (clientReturn: ClientReturn, data: MovieDetailedMDB?) -> ()) -> (){
        Client.Movies("\(movieID)", api_key: api_key, page: nil, language: language){
            apiReturn in
            var detailed = MovieDetailedMDB?()
            if(apiReturn.error == nil){
                detailed = MovieDetailedMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: detailed)
        }
    }
    
    ///Get the alternative titles for a specific movie id.
    public class func alternativeTitles(api_key: String!, movieID: Int!, country: String?, completion: (clientReturn: ClientReturn, altTitles: Alternative_TitlesMDB?) -> ()) -> (){
        //language changed to country to avoid modifiying multiple defined functions.
        Client.Movies("\(movieID)/alternative_titles", api_key: api_key, page: nil, language: country){
            apiReturn in
            var alt = Alternative_TitlesMDB?()
            if(apiReturn.error == nil){
                alt = Alternative_TitlesMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, altTitles: alt)
        }
    }
    
    ///Get the cast and crew information for a specific movie id.
    public  class func credits(api_key: String!, movieID: Int!, completion: (clientReturn: ClientReturn, credits: MovieCreditsMDB?) -> ()) -> (){
        Client.Movies("\(movieID)/credits", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var credits = MovieCreditsMDB?()
            if(apiReturn.error == nil){
                credits = MovieCreditsMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, credits: credits)
        }
    }
    
    ///Get the images (posters and backdrops) for a specific movie id.
    public class func images(api_key: String!, movieID: Int!, language: String?, completion: (clientReturn: ClientReturn, images: ImagesMDB?) -> ()) -> (){
        Client.Movies("\(movieID)/images", api_key: api_key, page: nil, language: language){
            apiReturn in
            var images = ImagesMDB?()
            if(apiReturn.error == nil){
                images = ImagesMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, images: images)
        }
    }
    
    ///Get the plot keywords for a specific movie id.
    public class func keywords(api_key: String!, movieID: Int, completion: (clientReturn: ClientReturn, keywords: [KeywordsMDB]?) -> ()) -> (){
        Client.Movies("\(movieID)/keywords", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var keywords = [KeywordsMDB]?()
            if(apiReturn.error == nil){
                keywords = KeywordsMDB.initialize(json: apiReturn.json!["keywords"])
            }
            completion(clientReturn: apiReturn, keywords: keywords)
        }
        
    }
    
    ///Get the release dates, certifications and related information by country for a specific movie id.
    public class func release_dates(api_key: String!, movieID: Int, completion: (clientReturn: ClientReturn, releatedDates: [MovieReleaseDatesMDB]?) -> ()) -> (){
        Client.Movies("\(movieID)/release_dates", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var releatedDates = [MovieReleaseDatesMDB]?()
            if(apiReturn.error == nil){
                releatedDates = MovieReleaseDatesMDB.initialize(json: apiReturn.json!["results"])
            }
            completion(clientReturn: apiReturn, releatedDates: releatedDates)
        }
        
    }
    
    ///Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
    public class func videos(api_key: String!, movieID: Int!, language: String?, completion: (clientReturn: ClientReturn, videos: [VideosMDB]?) -> ()) -> (){
        Client.Movies("\(movieID)/videos", api_key: api_key, page: nil, language: language){
            apiReturn in
            var videos = [VideosMDB]?()
            if(apiReturn.error == nil){
                videos = VideosMDB.initialize(json: apiReturn.json!["results"])
            }
            completion(clientReturn: apiReturn, videos: videos)
        }
    }
    
    ///Get the translations for a specific movie id.
    public class func translations(api_key: String!, movieID: Int!, completion: (clientReturn: ClientReturn, translations: TranslationsMDB? ) -> ()) -> (){
        Client.Movies("\(movieID)/translations", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var trans = TranslationsMDB?()
            if(apiReturn.error == nil){
                trans = TranslationsMDB.init(results: apiReturn.json!["translations"])
            }
            completion(clientReturn: apiReturn, translations: trans)
        }
        
    }
    
    ///Get the similar movies for a specific movie id.
    public class func similar(api_key: String!, movieID: Int!, page: Int?, language: String?, completion: (clientReturn: ClientReturn, movie: [MovieMDB]?) -> ()) -> (){
        Client.Movies("\(movieID)/similar", api_key: api_key, page: page, language: language){
            apiReturn in
            var movie = [MovieMDB]?()
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    movie = MovieMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientReturn: apiReturn, movie: movie)
        }
    }
    
    ///Get the reviews for a particular movie id.
    public class func reviews(api_key: String!, movieID: Int!, page: Int?, language: String, completion: (clientReturn: ClientReturn, reviews: [MovieReviewsMDB]?) -> ()) -> (){
        Client.Movies("\(movieID)/reviews", api_key: api_key, page: page, language: language){
            apiReturn in
            var reviews = [MovieReviewsMDB]?()
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    reviews = MovieReviewsMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientReturn: apiReturn, reviews: reviews)
        }
        
    }
    
    ///Get the lists that the movie belongs to.
    public class func list(api_key: String!, movieID: Int!, page: NSNumber?, language: String, completion: (clientReturn: ClientReturn, list: [MovieListMDB]?) -> ()) -> (){
        Client.Movies("\(movieID)/lists", api_key: api_key, page: page?.integerValue, language: language){
            apiReturn in
            var list = [MovieListMDB]?()
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    list = MovieListMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientReturn: apiReturn, list: list)
        }
        
    }
    ///Get the latest movie id.
    public class func latest(api_key: String!, completion: (clientReturn: ClientReturn, moviesDetailed: MovieDetailedMDB?) -> ()) -> (){
        Client.Movies("latest", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var movie = MovieDetailedMDB?()
            if(apiReturn.error == nil){
                movie = MovieDetailedMDB.init(results: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, moviesDetailed: movie)
        }
    }
    
    ///Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
    public class func nowplaying(api_key: String!,language: String?, page: Int?, completion: (clientReturn: ClientReturn, movie: [MovieMDB]?) -> ()) -> (){
        Client.Movies("now_playing", api_key: api_key, page: page, language: language){
            apiReturn in
            var movie = [MovieMDB]?()
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    movie = MovieMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientReturn: apiReturn, movie: movie)
        }
    }
    
    ///Get the list of popular movies on The Movie Database. This list refreshes every day.
    public class func popular(api_key: String!,language: String?, page: Int?, completion: (clientReturn: ClientReturn, movie: [MovieMDB]?) -> ()) -> (){
        Client.Movies("popular", api_key: api_key, page: page, language: language){
            apiReturn in
            var movie = [MovieMDB]?()
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    movie = MovieMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientReturn: apiReturn, movie: movie)
        }
    }
    
    ///Get the list of top rated movies. By default, this list will only include movies that have 50 or more votes. This list refreshes every day.
    public class func toprated(api_key: String!,language: String?, page: Int?, completion: (clientReturn: ClientReturn, movie: [MovieMDB]?) -> ()) -> (){
        Client.Movies("top_rated", api_key: api_key, page: page, language: language){
            apiReturn in
            var movie = [MovieMDB]?()
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    movie = MovieMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientReturn: apiReturn, movie: movie)
        }
    }
    
    ///Get the list of upcoming movies by release date. This list refreshes every day.
    public class func upcoming(api_key: String!,language: String?, completion: (clientReturn: ClientReturn, movie: [MovieMDB]?) -> ()) -> (){
        Client.Movies("upcoming", api_key: api_key, page: nil, language: language){
            apiReturn in
            var movie = [MovieMDB]?()
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    movie = MovieMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientReturn: apiReturn, movie: movie)
        }
    }
}
