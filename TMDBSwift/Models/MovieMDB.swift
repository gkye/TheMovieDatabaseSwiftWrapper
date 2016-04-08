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
            var aReturn = apiReturn
            var detailed = MovieDetailedMDB?()
            if(aReturn.error == nil){
                detailed = MovieDetailedMDB.init(results: apiReturn.json!)
                aReturn.MBDBReturn = detailed
            }
            completion(clientReturn: aReturn, data: detailed)
        }
    }
    
    ///Get the alternative titles for a specific movie id.
    public class func alternativeTitles(api_key: String!, movieID: Int!, country: String?, completion: (clientReturn: ClientReturn, altTitles: Alternative_TitlesMDB?) -> ()) -> (){
        //language changed to country to avoid modifiying multiple defined functions.
        Client.Movies("\(movieID)/alternative_titles", api_key: api_key, page: nil, language: country){
            apiReturn in
            var aReturn = apiReturn
            var alt = Alternative_TitlesMDB?()
            if(aReturn.error == nil){
                alt = Alternative_TitlesMDB.init(results: apiReturn.json!)
                aReturn.MBDBReturn = alt
            }
            completion(clientReturn: aReturn, altTitles: alt)
        }
    }
    
    ///Get the cast and crew information for a specific movie id.
    public  class func credits(api_key: String!, movieID: Int!, completion: (clientReturn: ClientReturn, credits: MovieCreditsMDB?) -> ()) -> (){
        Client.Movies("\(movieID)/credits", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var aReturn = apiReturn
            var credits = MovieCreditsMDB?()
            if(aReturn.error == nil){
                credits = MovieCreditsMDB.init(results: aReturn.json!)
                aReturn.MBDBReturn = credits
                
            }
            completion(clientReturn: aReturn, credits: credits)
        }
    }
    
    ///Get the images (posters and backdrops) for a specific movie id.
    public class func images(api_key: String!, movieID: Int!, language: String?, completion: (clientReturn: ClientReturn, images: ImagesMDB?) -> ()) -> (){
        Client.Movies("\(movieID)/images", api_key: api_key, page: nil, language: language){
            apiReturn in
            var aReturn = apiReturn
            var images = ImagesMDB?()
            if(aReturn.error == nil){
                images = ImagesMDB.init(results: apiReturn.json!)
                aReturn.MBDBReturn = images
            }
            completion(clientReturn: aReturn, images: images)
        }
    }
    
    ///Get the plot keywords for a specific movie id.
    public class func keywords(api_key: String!, movieID: Int, completion: (clientReturn: ClientReturn, keywords: [KeywordsMDB]?) -> ()) -> (){
        Client.Movies("\(movieID)/keywords", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var aReturn = apiReturn
            var keywords = [KeywordsMDB]?()
            if(aReturn.error == nil){
                keywords = KeywordsMDB.initialize_(aReturn.json!["keywords"])
                aReturn.MBDBReturn = keywords
            }
            completion(clientReturn: aReturn, keywords: keywords)
        }
        
    }
    
    ///Get the release dates, certifications and related information by country for a specific movie id.
    public class func release_dates(api_key: String!, movieID: Int, completion: (clientReturn: ClientReturn, releatedDates: [MovieReleaseDatesMDB]?) -> ()) -> (){
        Client.Movies("\(movieID)/release_dates", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var aReturn = apiReturn
            var releatedDates = [MovieReleaseDatesMDB]?()
            if(aReturn.error == nil){
                releatedDates = MovieReleaseDatesMDB.initialize(aReturn.json!["results"])
                aReturn.MBDBReturn = releatedDates
            }
            completion(clientReturn: aReturn, releatedDates: releatedDates)
        }
        
    }
    
    ///Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
    public class func videos(api_key: String!, movieID: Int!, language: String?, completion: (clientReturn: ClientReturn, videos: [VideosMDB]?) -> ()) -> (){
        Client.Movies("\(movieID)/videos", api_key: api_key, page: nil, language: language){
            apiReturn in
            var aReturn = apiReturn
            var videos = [VideosMDB]?()
            if(aReturn.error == nil){
                videos = VideosMDB.initialize(apiReturn.json!["results"])
                aReturn.MBDBReturn = videos
            }
            completion(clientReturn: aReturn, videos: videos)
        }
    }
    
    ///Get the translations for a specific movie id.
    public class func translations(api_key: String!, movieID: Int!, completion: (clientReturn: ClientReturn, translations: TranslationsMDB? ) -> ()) -> (){
        Client.Movies("\(movieID)/translations", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var aReturn = apiReturn
            var trans = TranslationsMDB?()
            if(aReturn.error == nil){
                trans = TranslationsMDB.init(translations: aReturn.json!["translations"])
                aReturn.MBDBReturn = trans
            }
            completion(clientReturn: aReturn, translations: trans)
        }
        
    }
    
    ///Get the similar movies for a specific movie id.
    public class func similar(api_key: String!, movieID: Int!, page: Int?, language: String?, completion: (clientReturn: ClientReturn, movie: [MovieMDB]?) -> ()) -> (){
        Client.Movies("\(movieID)/similar", api_key: api_key, page: page, language: language){
            apiReturn in
            var aReturn = apiReturn
            var movie = [MovieMDB]?()
            if(aReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    movie = MovieMDB.initialize(apiReturn.json!["results"])
                    aReturn.MBDBReturn = movie
                }
            }
            completion(clientReturn: aReturn, movie: movie)
        }
    }
    
    ///Get the reviews for a particular movie id.
    public class func reviews(api_key: String!, movieID: Int!, page: Int?, language: String, completion: (clientReturn: ClientReturn, reviews: [MovieReviewsMDB]?) -> ()) -> (){
        Client.Movies("\(movieID)/reviews", api_key: api_key, page: page, language: language){
            apiReturn in
            var aReturn = apiReturn
            var reviews = [MovieReviewsMDB]?()
            if(aReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    reviews = MovieReviewsMDB.initialize(aReturn.json!["results"])
                    aReturn.MBDBReturn = reviews
                }
            }
            completion(clientReturn: aReturn, reviews: reviews)
        }
        
    }
    
    ///Get the lists that the movie belongs to.
    public class func list(api_key: String!, movieID: Int!, page: NSNumber?, language: String, completion: (clientReturn: ClientReturn, list: [MovieListMDB]?) -> ()) -> (){
        Client.Movies("\(movieID)/lists", api_key: api_key, page: page?.integerValue, language: language){
            apiReturn in
            var aReturn = apiReturn
            var list = [MovieListMDB]?()
            if(aReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    list = MovieListMDB.initialize(aReturn.json!["results"])
                    aReturn.MBDBReturn = list
                }
            }
            completion(clientReturn: aReturn, list: list)
        }
        
    }
    ///Get the latest movie id.
   public class func latest(api_key: String!, completion: (clientReturn: ClientReturn, moviesDetailed: MovieDetailedMDB?) -> ()) -> (){
        Client.Movies("latest", api_key: api_key, page: nil, language: nil){
            apiReturn in
            var aReturn = apiReturn
            var movie = MovieDetailedMDB?()
            if(aReturn.error == nil){
                movie = MovieDetailedMDB.init(results: apiReturn.json!)
                aReturn.MBDBReturn = movie
            }
            completion(clientReturn: aReturn, moviesDetailed: movie)
        }
    }
    
    ///Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
    public class func nowplaying(api_key: String!,language: String?, page: Int?, completion: (clientReturn: ClientReturn, movie: [MovieMDB]?) -> ()) -> (){
        Client.Movies("now_playing", api_key: api_key, page: page, language: language){
            apiReturn in
            var aReturn = apiReturn
            var movie = [MovieMDB]?()
            if(aReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    movie = MovieMDB.initialize(apiReturn.json!["results"])
                    aReturn.MBDBReturn = movie
                }
            }
            completion(clientReturn: aReturn, movie: movie)
        }
    }
    
    ///Get the list of popular movies on The Movie Database. This list refreshes every day.
    public class func popular(api_key: String!,language: String?, page: Int?, completion: (clientReturn: ClientReturn, movie: [MovieMDB]?) -> ()) -> (){
        Client.Movies("popular", api_key: api_key, page: page, language: language){
            apiReturn in
            var aReturn = apiReturn
            var movie = [MovieMDB]?()
            if(aReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    movie = MovieMDB.initialize(apiReturn.json!["results"])
                    aReturn.MBDBReturn = movie
                }
            }
            completion(clientReturn: aReturn, movie: movie)
        }
    }
    
    ///Get the list of top rated movies. By default, this list will only include movies that have 50 or more votes. This list refreshes every day.
    public class func toprated(api_key: String!,language: String?, completion: (clientReturn: ClientReturn, movie: [MovieMDB]?) -> ()) -> (){
        Client.Movies("top_rated", api_key: api_key, page: nil, language: language){
            apiReturn in
            var aReturn = apiReturn
            var movie = [MovieMDB]?()
            if(aReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    movie = MovieMDB.initialize(apiReturn.json!["results"])
                    aReturn.MBDBReturn = movie
                }
            }
            completion(clientReturn: aReturn, movie: movie)
        }
    }
    
    ///Get the list of upcoming movies by release date. This list refreshes every day.
    public class func upcoming(api_key: String!,language: String?, completion: (clientReturn: ClientReturn, movie: [MovieMDB]?) -> ()) -> (){
        Client.Movies("upcoming", api_key: api_key, page: nil, language: language){
            apiReturn in
            var aReturn = apiReturn
            var movie = [MovieMDB]?()
            if(aReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    movie = MovieMDB.initialize(apiReturn.json!["results"])
                    aReturn.MBDBReturn = movie
                }
            }
            completion(clientReturn: aReturn, movie: movie)
        }
    }
    
    
    
    
    
}
