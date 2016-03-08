
//
//  MovieVC.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-16.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class MovieVC : UIViewController{
    
    override func viewDidLoad() {
        
        //        }
        //
        //        Discover.discover(apikey, discoverType: "tv", language: nil){
        //            apiReturn in
        //            let tvshows = apiReturn.MBDBReturn as! [TVMDB]
        //            print(tvshows[0].name)
        //            print(tvshows[0].overview)
        //            print(tvshows[0].popularity)
        //        }
        //
        
        //Get all Western(37) movies, exclude adult movies
        //        GenresMDB.genre_movies(apikey, genreId: 37, include_all_movies: true, include_adult_movies: false, language: "EN"){
        //            apiReturn in
        //            print(apiReturn.pageResults?.total_pages)
        //            print(apiReturn.pageResults?.total_results)
        //
        //            let movie = apiReturn.MBDBReturn as! [MovieMDB]
        //            print(movie[0].title)
        //            print(movie[0].original_title)
        //            print(movie[0].release_date)
        //            print(movie[0].overview)
        //        }
        //
        //        //Get the list of movie OR tv genres
        //        GenresMDB.genres(apikey, listType: "tv", language: "FR"){
        //            apiReturn in
        //            let genres = apiReturn.MBDBReturn as! [GenresMDB]
        //            for i in genres {
        //                print(i.name)
        //            }
        //        }
        //
        
        
        //        TVSeasonsMDB.season_number(apikey, tvShowId: 1398, seasonNumber: 1, language: "EN"){
        //            apiReturn in
        //            let season = apiReturn.MBDBReturn as! TVSeasonsMDB
        //            print(season.name)
        //            print(season.overview)
        //            print(season.episodes[0].name)
        //        }
        //
        //        TVSeasonsMDB.season_credits(apikey, tvShowId: 1398, seasonNumber: 1, language: "EN"){
        //                    apiReturn in
        //                    let credits = apiReturn.MBDBReturn as! CastCrewMDB
        //                    print(credits.crew.count)
        //                    for i in credits.cast {
        //                        print(i.credit_id)
        //                    }
        //                    for i1 in credits.crew {
        //                        print(i1.job)
        //                    }
        //                }
        //
        //        TVSeasonsMDB.season_videos(apikey, tvShowId: 60735, seasonNumber: 1, language: "EN"){
        //                    apiReturn in
        //                    let videos = apiReturn.MBDBReturn as! [VideosMDB]
        //                    for vid in videos {
        //                        print(vid.site)
        //                        print(vid.name)
        //                    }
        //        }
        //
        //
        //        //backdrops will be null
        //        TVSeasonsMDB.season_images(apikey, tvShowId: 60735, seasonNumber: 1, language: "EN"){
        //            apiReturn in
        //            let images = apiReturn.MBDBReturn as! ImagesMDB
        //            print(images.posters[0].iso_639_1)
        //            print(images.posters[0].width)
        //            print(images.posters[0].file_path)
        //
        //        }
        //** episode start
        
        
        //The flash season 1, episode 3 information
        //        TVEpisodesMDB.number(apikey, tvShowId: 60735, seasonNumber: 1, episodeNumber: 3, language: nil){
        //            apiReturn in
        //            let episodes = TVEpisodesMDB.init(results: apiReturn.json!)
        //            print(episodes.overview)
        //            print(episodes.guest_stars[0].character)
        //            print(episodes.crew[0].name)
        //        }
        //
        //       // The flash season 1, episode 3 credits
        //        TVEpisodesMDB.credits(apikey, tvShowId: 60735, seasonNumber: 1, episodeNumber: 3){
        //            apiReturn in
        //            let credits = apiReturn.MBDBReturn as! CastCrewMDB
        //            print(credits.crew.count)
        //            for i in credits.cast {
        //                print(i.credit_id)
        //            }
        //            for i1 in credits.crew {
        //                print(i1.job)
        //            }
        //        }
        //        TVEpisodesMDB.externalIDS(apikey, tvShowId: 60735, seasonNumber: 1, episodeNumber: 1, language: "en"){
        //            apiReturn in
        //            let ids = apiReturn.MBDBReturn as! ExternalIdsMDB
        //            print(ids.imdb_id)
        //            print(ids.tvdb_id) //**might return nil
        //            print(ids.freebase_mid)
        //            print(ids.freebase_id)
        //            print(ids.tvrage_id)
        //        }
        
        //        TVEpisodesMDB.images(apikey, tvShowId: 60735, seasonNumber: 1, episodeNumber: 1){
        //            apiReturn in
        //            let images = apiReturn.MBDBReturn as! ImagesMDB
        //            print(images.stills[0].iso_639_1)
        //            print(images.stills[0].width)
        //            print(images.stills[0].file_path)
        //            //TV show have no posters or backdrops (stills only)
        //        }
        
        //        //Game of thrones season 5 episode 1
        TVEpisodesMDB.videos(apikey, tvShowId: 1399, seasonNumber: 5, episodeNumber: 1, language: nil){
            apiReturn in
            let videos = apiReturn.MBDBReturn as! [VideosMDB]
            for vid in videos {
                print(vid.site)
                print(vid.name)
                print(vid.type)
            }
        }
                
        
        //        MovieMDB.movie(apikey, movieID: 7984, language: "en"){
        //            apiReturn in
        //            let movie = apiReturn.MBDBReturn as! MovieDetailedMDB
        //            print(movie.title)
        //            print(movie.revenue)
        //            print(movie.genres[0].name)
        //            print(movie.production_companies[0].name)
        //
        //        }
        
        //        MovieMDB.alternativeTitles(apikey, movieID: 12, country: nil){
        //            apiReturn in
        //            let altTitles = apiReturn.MBDBReturn as! Alternative_TitlesMDB
        //            print(apiReturn.json)
        //            print(altTitles.titles[0])
        //            print(altTitles.id)
        //        }
        
        //        MovieMDB.credits(apikey, movieID: 871){
        //            apiReturn in
        //            let credits = apiReturn.MBDBReturn as! CastCrewMDB
        //            for i in credits.cast {
        //                print(i.cast_id)
        //            }
        //            for i1 in credits.crew {
        //                print(i1.job)
        //            }
        //        }
        
        //        MovieMDB.images(apikey, movieID: 293660, language: "en"){
        //            imgs in
        //            let images = imgs.MBDBReturn as! ImagesMDB
        //            print(images.posters[0].file_path)
        //            //Backdrop & stills might return `nil`
        //            //print(images.stills[0].file_path)
        //            //print(images.backdrops[0].file_path)
        //        }
        //
        //        MovieMDB.keyword(apikey, keywordId: 334, page: 1){
        //            apiReturn in
        //            let movie = apiReturn.MBDBReturn as! [MovieMDB]
        //            print(movie[0].title)
        //            print(movie[0].original_title)
        //            print(movie[0].release_date)
        //            print(movie[0].overview)
        //        }
        
        
        //        MovieMDB.videos(apikey, movieID: 607, language: "en"){
        //            apiReturn in
        //            let videos = apiReturn.MBDBReturn as! [VideosMDB]
        //            for i in videos {
        //                print(i.site)
        //                print(i.key)
        //                print(i.name)
        //            }
        //        }
        
        //        MovieMDB.similar(apikey, movieID: 334, page: 1, language: "en"){
        //            relatedMovies in
        //            let movie = relatedMovies.MBDBReturn as! [MovieMDB]
        //            print(movie[0].title)
        //            print(movie[0].original_title)
        //            print(movie[0].release_date)
        //            print(movie[0].overview)
        //        }
        
        //        MovieMDB.latest(apikey){
        //            latestMovies in
        //            let movie = latestMovies.MBDBReturn as! MovieDetailedMDB
        //            print(movie.title)
        //            print(movie.original_title)
        //            print(movie.release_date)
        //            print(movie.overview)
        //            print(movie.budget)
        //        }
        
        //        MovieMDB.nowplaying(apikey, language: "en", page: 1){
        //            nowPlaying in
        //            let movie = nowPlaying.MBDBReturn as! [MovieMDB]
        //            print(movie[0].title)
        //            print(movie[0].original_title)
        //            print(movie[0].release_date)
        //            print(movie[0].overview)
        //        }
        
        //        MovieMDB.popular(apikey, language: "en", page: 1){
        //            popularMovies in
        //            let movie = popularMovies.MBDBReturn as! [MovieMDB]
        //            print(movie[0].title)
        //            print(movie[0].original_title)
        //            print(movie[0].release_date)
        //            print(movie[0].overview)
        //        }
        
        //        MovieMDB.toprated(apikey, language: "en"){
        //            topRatedMovies in
        //            let movie = topRatedMovies.MBDBReturn as! [MovieMDB]
        //            print(movie[0].title)
        //            print(movie[0].original_title)
        //            print(movie[0].release_date)
        //            print(movie[0].overview)
        //        }
        
        //        MovieMDB.upcoming(apikey, language: "en"){
        //            upcomingMovies in
        //            let movie = upcomingMovies.MBDBReturn as! [MovieMDB]
        //            print(movie[0].title)
        //            print(movie[0].original_title)
        //            print(movie[0].release_date)
        //            print(movie[0].overview)
        //        }
        
        
        
        
    }
    
}
